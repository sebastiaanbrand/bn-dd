#include <iostream>
#include <fstream>
#include <algorithm>
#include <bits/stdc++.h>
#include <stdlib.h>
#include <sys/time.h>

#include <wpbdd_inference.hpp>

/**
 * Obtain current wallclock time
 */
static double
wctime()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (tv.tv_sec + 1E-6 * tv.tv_usec);
}


/**********************<Weighted model counting>*******************************/

TASK_IMPL_5(double, wpbdd_modelcount, sylvan::BDD, dd, int *, meta, ProbMap *, pm, std::vector<int> *, rv_vars, int, i)
{
    if (dd == sylvan::sylvan_true) return 1.0;
    if (dd == sylvan::sylvan_false) return 0.0;


    /* Consult cache */
    // TODO: encode meta in e.g. LDD and add to cache key?
    union { double d; uint64_t s; } hack;
    int cachenow = 1;
    if (cachenow) {
        if (sylvan::cache_get3(CACHE_WPBDD_MODELCOUNT, dd, 0, 0, &hack.s)) {
            return hack.d;
        }
    }

    sylvan::mtbddnode_t node = sylvan::MTBDD_GETNODE(dd);
    uint32_t var     = sylvan::mtbddnode_getvariable(node);
    sylvan::BDD low  = sylvan::mtbddnode_getlow(node);
    sylvan::BDD high = sylvan::mtbddnode_gethigh(node);
    double prob_low  = 0;
    double prob_high = 0;


    // RV var has been skipped
    if (i < static_cast<int>(rv_vars->size()) && static_cast<int>(var) > (*rv_vars)[i]) {
        // reinsert skipped var
        var = (*rv_vars)[i];
        low = dd;
        high = dd;
        // TODO: instead of reinserting in all cases,  we can have handle 
        // things more efficiently depending on meta[var]
    }

    switch (meta[var])
    {
    case no_rv_var:
        // current var should correspond to a weight / prob
        prob_low  = CALL(wpbdd_modelcount, low, meta, pm, rv_vars, i); // only used for assert
        prob_high = CALL(wpbdd_modelcount, high, meta, pm, rv_vars, i);
        assert(pm->count(var));
        assert(prob_low == 0);
        hack.d = (*pm)[var] * prob_high;
        break;
    case marg_out:
        // current var should be marginalized out
        prob_low  = CALL(wpbdd_modelcount, low, meta, pm, rv_vars, i+1);
        prob_high = CALL(wpbdd_modelcount, high, meta, pm, rv_vars, i+1);
        hack.d = prob_low + prob_high;
        break;
    case marg_0:
        // compute prob for var = 0
        prob_low  = CALL(wpbdd_modelcount, low, meta, pm, rv_vars, i+1);
        hack.d = prob_low;
        break;
    case marg_1:
        // compute prob for var = 1
        prob_high = CALL(wpbdd_modelcount, high, meta, pm, rv_vars, i+1);
        hack.d = prob_high;
        break;
    default:
        std::cerr << "Unknown meta value '" << meta[var] << "'" << std::endl;
        exit(1);
        break;
    }


    /* Put in cache */
    if (cachenow) {
        sylvan::cache_put3(CACHE_WPBDD_MODELCOUNT, dd, 0, 0, hack.s);
    }

    return hack.d;
}

double wpbdd_marginalize(WpBdd wpbdd, Constraint x)
{
    // Construct meta which encodes computing Pr(var1=val1 ^ var2=val2 ^ ... )
    int meta[wpbdd.nvars] = {0};
    for (int i : wpbdd.rv_vars) {
        meta[i] = marg_out; // initially marginalize all (rv) vars out
    }
    for (std::pair<int,bool> x_i : x) {
        // constrain var_i = val_i
        meta[x_i.first] = x_i.second ? marg_1 : marg_0;
    }

    // Compute using model counting
    sylvan::cache_clear(); // new meta, need to reset cache
    return wpbdd_modelcount(wpbdd.dd.GetBDD(), meta, &(wpbdd.pm), &(wpbdd.rv_vars));
}

double wpbdd_condition(WpBdd wpbdd, Constraint x, Constraint y)
{
    // Pr( X=x | Y=y ) = Pr( X=x ^ Y=y ) / Pr( Y=y )
    Constraint x_and_y(x);
    x_and_y.insert(y.begin(), y.end());
    double num = wpbdd_marginalize(wpbdd, x_and_y); // Pr( X=x ^ Y=y )
    double denom = wpbdd_marginalize(wpbdd, y);     // Pr( Y=y )
    return num / denom;
}

double wpbdd_do(WpBdd wpbdd, Constraint x, Constraint t, std::set<int> pt)
{
    // Pr( X=x| do(T=t) ) = Pr( X=x ^ T=t ) / Pr( T=t | pa(T)_{|X=x} )
    Constraint x_and_t(x);
    x_and_t.insert(t.begin(), t.end());
    double num = wpbdd_marginalize(wpbdd, x_and_t); // Pr( X=x ^ T=t )

    Constraint ptx;
    for (std::pair<int,bool> x_i : x) {
        if (pt.find(x_i.first) != pt.end()) { // if x \in pt
            ptx.insert(x_i);
        }
    }

    double denom = wpbdd_condition(wpbdd, t, ptx);  // Pr( T=t | pa(T)_{X=x}) )

    return num/denom;
}

Constraint constrain(std::vector<int> vars, int val)
{
    Constraint res;

    int _val = val;
    for (int i = vars.size() - 1; i >= 0; i--) {
        res.insert({vars[i], _val % 2});
        _val = _val >> 1;
    }

    if (_val != 0) {
        std::cerr << "Warning: " << val << " cannot be encoded in " 
                  << vars.size() << " Boolean variables" << std::endl;
    }

    return res;
}

/*********************</Weighted model counting>*******************************/





/***************<Loading CNF from file + building WPBDD>***********************/

static int max_var;

WpBdd wpbdd_from_files(std::string filepath, bool trackpeak, bool verbose)
{
    WpBdd wpbdd;

    // load cnf
    if (verbose) std::cout << "loading CNF from " << filepath << std::endl;
    Cnf f = cnf_from_file(filepath + ".cnf", &(wpbdd.bn2cnf_time));
    if (verbose) print_cnf(f);

    // convert cnf to bdd
    if (verbose) std::cout << "converting CNF to BDD" << std::endl;
    double t_start = wctime();
    wpbdd.dd = cnf_to_bdd(f, trackpeak, &wpbdd.peaknodes);
    wpbdd.nvars = max_var + 1; // set by cnf_from_file(), not super clean
    wpbdd.build_time = wctime() - t_start;

    // load RV var information
    wpbdd.rv_vars = rv_vars_from_file(filepath + ".cnf_rv_vars");
    if (verbose) print_rv_vars(wpbdd.rv_vars);

    // load probabilities
    if (verbose) std::cout << "loading probs from " << filepath << std::endl;
    wpbdd.pm = probs_from_file(filepath + ".cnf_probs");
    if (verbose) print_probmap(wpbdd.pm);

    return wpbdd;
}

Cnf cnf_from_file(std::string filepath, double *bn_to_cnf_time)
{
    Cnf res;
    max_var = 0;

    std::string line;
    std::string token;
    std::ifstream inFile(filepath);
    if (inFile.is_open()) {
        while (getline(inFile, line)) {
            Clause clause;
            std::istringstream ss(line);
            while (ss >> token) {
                if (token == "p" || token == "cnf") {
                    break;
                }
                if (token == "c") {
                    ss >> token;
                    *bn_to_cnf_time = std::stod(token);
                    break;
                }
                int var = std::stoi(token);
                if (var == 0) {
                    break;
                }
                clause.insert(var);
                max_var = std::max(max_var, std::abs(var));
            }
            if (clause.size() > 0) {
                res.insert(clause);
            }
        }
        inFile.close();
    } else {
        std::cerr << "unable to open " << filepath << std::endl;
    }

    return res;
}

void print_clause(Clause clause)
{
    int var_prev = 0;
    std::cout << "(";
    for (int var : clause) {
        if (var_prev > 0) {
            std::cout << "x" << var_prev << " v ";
        } else if (var_prev < 0) {
            std::cout << "~x" << std::abs(var_prev) << " v ";
        }
        var_prev = var;
    }
    std::cout << "x" << var_prev << ")";
}

void print_cnf(Cnf cnf)
{
    Clause clause_prev;
    for (Clause clause : cnf) {
        if (clause_prev.size() != 0) {
            print_clause(clause_prev);
            std::cout << " ^ ";
        }
        clause_prev = clause;
    }
    print_clause(clause_prev);
    std::cout << std::endl;
}

sylvan::Bdd cnf_to_bdd(Cnf f, bool trackpeak, size_t *peaknodes)
{
    sylvan::Bdd res = sylvan::Bdd::bddOne();
    int freq = 1;
    if (trackpeak) {
        *peaknodes = 0;
        // count nodes 100 times
        freq = (int) std::ceil((double)f.size() / 100.0);
    }

    int i = 0;
    for (Clause clause : f){
        sylvan::Bdd c = sylvan::Bdd::bddZero();

        for (int lit : clause) {
            if (lit != 0) {
                sylvan::Bdd l = sylvan::Bdd::bddVar(abs(lit));
                if (lit < 0) l = !l;
                c = c | l;
            }
        }

        res = res & c;
        if (trackpeak != 0 && (i % freq == 0)) {
            *peaknodes = std::max(*peaknodes, sylvan::sylvan_nodecount(res.GetBDD()));
        }
        i++;
    }

    return res;
}

ProbMap probs_from_file(std::string filepath)
{
    ProbMap res;

    std::string line;
    std::string token;
    std::ifstream inFile(filepath);
    if (inFile.is_open()) {
        while (getline(inFile, line)) {
            std::istringstream ss(line);
            ss >> token;
            int var = std::stoi(token);
            ss >> token;
            double prob = atof(token.c_str());
            res[var] = prob;
        }
    } else {
        std::cerr << "unable to open " << filepath << std::endl;
    }

    return res;
}

std::vector<int> rv_vars_from_file(std::string filepath)
{
    std::vector<int> rv_vars;

    std::string line;
    std::string token;
    std::ifstream infile(filepath);
    if (infile.is_open()) {
        while (getline(infile, line)) {
            std::istringstream ss(line);
            ss >> token; // first token in the name of the rv
            while (ss >> token) {
                int var = std::stoi(token);
                rv_vars.push_back(var);
            }
        }
    } else {
        std::cerr << "unable to open " << filepath << std::endl;
    }

    std::sort(rv_vars.begin(), rv_vars.end());
    return rv_vars;
}

void print_probmap(ProbMap pm)
{
    for (auto it = pm.begin(); it != pm.end(); it++) {
        std::cout << "(" << it->first << ", " << it->second << ") ";
    }
    std::cout << std::endl;
}

void print_rv_vars(std::vector<int> rv_vars)
{
    std::cout << "RV vars: ";
    for (int rv_var : rv_vars) {
        std::cout << rv_var << " ";
    }
    std::cout << std::endl;
}

/**************</Loading CNF from file + building WPBDD>***********************/
