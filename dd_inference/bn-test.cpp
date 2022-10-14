#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <iterator>
#include <set>
#include <stdlib.h>

#include <wpbdd_inference.hpp>


typedef std::set<int> Clause;
typedef std::set<Clause> Cnf;
typedef std::map<int, int> VarConstraint; // var -> var_meta

static ProbMap pm; // use global var for now

int max_var;

void printMeta(int *meta, int n)
{
    std::cout << "Pr( "; fflush(stdout);
    for (int i = 0; i < n; i++) {
        if (meta[i] == marg_0) {
            std::cout << "x" << i << "=" << 0 << " "; fflush(stdout);
        }
        else if (meta[i] == marg_1) {
            std::cout << "x" << i << "=" << 1 << " "; fflush(stdout);
        }
    }
    std::cout << "| "; fflush(stdout);
    for (int i = 0; i < n; i ++) {
        if (meta[i] == cond_0) {
            std::cout << "x" << i << "=" << 0 << " "; fflush(stdout);
        }
        else if (meta[i] == cond_1) {
            std::cout << "x" << i << "=" << 1 << " "; fflush(stdout);
        }
    }
    std::cout << ")"; fflush(stdout);
}


double wpbdd_marginals(sylvan::Bdd dd, VarConstraint part_constraint, int nvars)
{
    int meta[nvars] = {marg_out}; // by default marginalize vars out

    // mark probability vars as no_rv_vars
    for (auto const& v : pm) {
        meta[v.first] = no_rv_var;
    }

    // add the given (partial) constraint
    for (auto const& a : part_constraint) {
        meta[a.first] = a.second;
    }

    printMeta(meta, nvars);
    std::cout << std::endl;

    return wpbdd_modelcount(dd.GetBDD(), meta, &pm);
}

void printClause(Clause clause)
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

void printProbMap(ProbMap pm)
{
    for (auto it = pm.begin(); it != pm.end(); it++) {
        std::cout << "(" << it->first << ", " << it->second << ") ";
    }
    std::cout << std::endl;
}

void printCnf(Cnf cnf)
{
    Clause clause_prev;
    for (Clause clause : cnf) {
        if (clause_prev.size() != 0) {
            printClause(clause_prev);
            std::cout << " ^ ";
        }
        clause_prev = clause;
    }
    printClause(clause_prev);
    std::cout << std::endl;
}

Cnf CnfFromFile(std::string filepath)
{
    Cnf res;
    max_var = 0;

    std::string line;
    std::string token;
    std::ifstream inFile(filepath);
    if (inFile.is_open()) {
        std::cout << "loading CNF from " << filepath << std::endl;
        while (getline(inFile, line)) {
            Clause clause;
            std::istringstream ss(line);
            while (ss >> token) {
                if (token == "p" || token == "cnf") {
                    break;
                }
                int var = std::stoi(token);
                clause.insert(var);
                max_var = std::max(max_var, std::abs(var));
            }
            if (clause.size() > 0) {
                res.insert(clause);
            }
        }
        inFile.close();
    } else {
        std::cout << "unable to open " << filepath << std::endl;
    }

    return res;
}

ProbMap probsFromFile(std::string filepath)
{
    ProbMap res;

    std::string line;
    std::string token;
    std::ifstream inFile(filepath);
    if (inFile.is_open()) {
        std::cout << "loading probs from " << filepath << std::endl;
        while (getline(inFile, line)) {
            std::istringstream ss(line);
            ss >> token;
            int var = std::stoi(token);
            ss >> token;
            double prob = atof(token.c_str());
            res[var] = prob;
        }
    }

    return res;
}

sylvan::Bdd Cnf2Bdd(Cnf f)
{
    sylvan::Bdd res = sylvan::Bdd::bddOne();

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
    }
    
    return res;
}

void small_example()
{
    // hardcoded example from 2016, Dal, p.5-6
    enum {blank, a1, a2, w1, b1, b2, b3, w2, w3};

    Cnf f = {{a1, a2}, {-a1, -a2}, 
             {b1, b2, b3}, {-b1, -b2}, {-b1, -b3}, {-b2, -b3},
             {-a1, w1}, {-a2, w2},
             {-a1, -b1, w2}, {-a1, -b2, w2}, {-a1, -b1, w2},
             {-a1, -b2, w2}, {-a1, -b3, w3}, {-a2, -b3, w3}};

    sylvan::Bdd b = Cnf2Bdd(f);

    FILE *fp = fopen("small_example.dot", "w");
    b.PrintDot(fp);
    fclose(fp);

}


void _computeAllProbsRec(sylvan::Bdd dd, std::vector<int> rv_vars, int n, int *meta, int i)
{
    if (i == n) {
        // call modelcount here
        double count = wpbdd_modelcount(dd.GetBDD(), meta, &pm);
        sylvan::cache_clear(); // temp, since  meta is not part of the cache key
        printMeta(meta, n);
        std::cout << " = " << count << std::endl;
        return;
    }

    if ( std::find(rv_vars.begin(), rv_vars.end(), i) != rv_vars.end() ){
        meta[i] = marg_0;
        _computeAllProbsRec(dd, rv_vars, n, meta, i + 1);
    
        meta[i] = marg_1;
        _computeAllProbsRec(dd, rv_vars, n, meta, i + 1);
    }
    else {
        meta[i] = 0;
        _computeAllProbsRec(dd, rv_vars, n, meta, i + 1);
    }
    
}


void computeAllProbs(sylvan::Bdd dd, std::vector<int> rv_vars)
{
    int n = 10;  // TODO: don't hardcode this
    int meta[n];

    _computeAllProbsRec(dd, rv_vars, n, meta, 0);
}

int main(int argc, char** argv) {

    // Standard Lace initialization with 1 worker
    lace_start(1, 0);

    // Simple Sylvan initialization, also initialize BDD support
    sylvan::sylvan_set_sizes(1LL<<16, 1LL<<16, 1LL<<16, 1LL<<16);
    sylvan::sylvan_init_package();
    sylvan::sylvan_init_bdd();

    // TODO: maybe it's simpler to just use the C interface of Sylvan?
    // (still in C++ file to make the rest of the programming a bit easier)


    //Cnf f = {{1, 2, 3}, {1, 2, -3}, {1, -2, -3}};
    //Bdd b = Cnf2Bdd(f);
    //std::cout << "satcount: " << b.SatCount(3) << std::endl;
    //small_example();
    std::string path;
    if (argc == 2) {
        path = argv[1];
    } else {
        std::cout << "Please specify an input file (without .cnf)" << std::endl;
        exit(1);
    }

    Cnf f = CnfFromFile(path + ".cnf");
    printCnf(f);
    sylvan::Bdd dd = Cnf2Bdd(f);
    
    pm = probsFromFile(path + ".cnf_probs");
    printProbMap(pm);

    FILE *fp = fopen("wpbdd.dot", "w");
    dd.PrintDot(fp);
    fclose(fp);

    std::vector<int> rv_vars{1, 2, 3};
    computeAllProbs(dd, rv_vars);
    VarConstraint a{{1, marg_0}, {2, marg_1}, {3, marg_1}};
    int nvars = 10; // dd vars
    wpbdd_marginals(dd, a, nvars);

    sylvan::sylvan_quit();
    lace_stop();

    return 0;
}
