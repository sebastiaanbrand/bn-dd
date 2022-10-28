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


double wpbdd_marginals(WpBdd wpbdd, VarConstraint part_constraint)
{
    int meta[wpbdd.nvars] = {marg_out}; // by default marginalize vars out

    // mark probability vars as no_rv_vars
    for (auto const& v : wpbdd.pm) {
        meta[v.first] = no_rv_var;
    }

    // add the given (partial) constraint
    for (auto const& a : part_constraint) {
        meta[a.first] = a.second;
    }

    printMeta(meta, wpbdd.nvars);
    std::cout << std::endl;

    return wpbdd_modelcount(wpbdd.dd.GetBDD(), meta, &(wpbdd.pm));
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


void _computeAllProbsRec(WpBdd wpbdd, int *meta, int i)
{
    if (i == wpbdd.nvars) {
        // call modelcount here
        double count = wpbdd_modelcount(wpbdd.dd.GetBDD(), meta, &(wpbdd.pm));
        sylvan::cache_clear(); // temp, since  meta is not part of the cache key
        printMeta(meta, wpbdd.nvars);
        std::cout << " = " << count << std::endl;
        return;
    }

    if ( std::find(wpbdd.rv_vars.begin(), wpbdd.rv_vars.end(), i) != wpbdd.rv_vars.end() ){
        meta[i] = marg_0;
        _computeAllProbsRec(wpbdd, meta, i + 1);
    
        meta[i] = marg_1;
        _computeAllProbsRec(wpbdd, meta, i + 1);
    }
    else {
        meta[i] = 0;
        _computeAllProbsRec(wpbdd, meta, i + 1);
    }
    
}


void computeAllProbs(WpBdd wpbdd)
{
    int meta[wpbdd.nvars];
    _computeAllProbsRec(wpbdd, meta, 0);
}

void marinalizeIndividual(WpBdd wpbdd)
{
    double prob0, prob1;
    for (int var : wpbdd.rv_vars) {
        prob0 = wpbdd_marginalize(wpbdd, {{var, 0}});
        prob1 = wpbdd_marginalize(wpbdd, {{var, 1}});
        std::cout << "Pr( x" << var << "=0 ) = " << prob0 << std::endl;
        std::cout << "Pr( x" << var << "=1 ) = " << prob1 << std::endl;
    }
}

void conditionPairs(WpBdd wpbdd)
{
    double prob00, prob01, prob10, prob11;
    for (int x : wpbdd.rv_vars) {
        for (int y : wpbdd.rv_vars) {
            if (x != y) {
                prob00 = wpbdd_condition(wpbdd, {{x, 0}}, {{y, 0}});
                prob01 = wpbdd_condition(wpbdd, {{x, 0}}, {{y, 1}});
                prob10 = wpbdd_condition(wpbdd, {{x, 1}}, {{y, 0}});
                prob11 = wpbdd_condition(wpbdd, {{x, 1}}, {{y, 1}});
                std::cout << "Pr( x" << x << "=0 | x" << y << "=0 ) = " << prob00 << std::endl;
                std::cout << "Pr( x" << x << "=0 | x" << y << "=1 ) = " << prob01 << std::endl;
                std::cout << "Pr( x" << x << "=1 | x" << y << "=0 ) = " << prob10 << std::endl;
                std::cout << "Pr( x" << x << "=1 | x" << y << "=1 ) = " << prob11 << std::endl;
            }
        }
    }
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

    WpBdd wpbdd;

    Cnf f = CnfFromFile(path + ".cnf");
    printCnf(f);
    wpbdd.dd = Cnf2Bdd(f);

    wpbdd.pm = probsFromFile(path + ".cnf_probs");
    printProbMap(wpbdd.pm);

    FILE *fp = fopen("wpbdd.dot", "w");
    wpbdd.dd.PrintDot(fp);
    fclose(fp);

    wpbdd.rv_vars = {1,2,3}; // TODO: don't hardcode this
    wpbdd.nvars = max_var + 1;

    std::vector<int> rv_vars{1, 2, 3};
    computeAllProbs(wpbdd);
    VarConstraint a{{1, marg_0}, {2, marg_1}, {3, marg_1}};
    wpbdd_marginals(wpbdd, a);
    marinalizeIndividual(wpbdd);
    conditionPairs(wpbdd);

    sylvan::sylvan_quit();
    lace_stop();

    return 0;
}
