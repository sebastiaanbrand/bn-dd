#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <iterator>
#include <set>
#include <map>
#include <stdlib.h>

#include <sylvan.h>
#include <sylvan_obj.hpp>
#include <sylvan_int.h>


//using namespace ::sylvan;

typedef std::set<int> Clause;
typedef std::set<Clause> Cnf;
typedef std::map<int,double> ProbMap;
typedef sylvan::BDD WPBDD;

ProbMap pm; // use global var for now

static const uint64_t CACHE_WPBDD_MODELCOUNT      = (200LL<<40);

#define wpbdd_modelcount(dd) RUN(wpbdd_modelcount, dd)
TASK_1(double, wpbdd_modelcount, WPBDD, dd)
{
    // TODO: deal with skipped vars
    // TODO: add restriction (i.e. compute marginal/conditional probabilities)
    if (dd == sylvan::sylvan_true) return 1.0;
    if (dd == sylvan::sylvan_false) return 0.0;


    /* Consult cache */
    union { double d; uint64_t s; } hack;
    if (sylvan::cache_get3(CACHE_WPBDD_MODELCOUNT, dd, 0, 0, &hack.s)) {
        return hack.d;
    }

    sylvan::mtbddnode_t node = sylvan::MTBDD_GETNODE(dd);
    uint32_t var = sylvan::mtbddnode_getvariable(node);
    WPBDD low    = sylvan::mtbddnode_getlow(node);
    WPBDD high   = sylvan::mtbddnode_gethigh(node);

    double prob_low  = CALL(wpbdd_modelcount, low);
    double prob_high = CALL(wpbdd_modelcount, high);

    if (pm.count(var)) {
        // current var corresponds to a weight / prob
        double current = pm[var];
        hack.d = current * prob_high;
        assert (prob_low == 0);
    } else {
        // current var corresponds to an RV assignment
        hack.d = prob_low + prob_high;
    }

    /* Put in cache */
    sylvan::cache_put3(CACHE_WPBDD_MODELCOUNT, dd, 0, 0, hack.s);

    return hack.d;
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
    }

    Cnf f = CnfFromFile(path + ".cnf");
    printCnf(f);
    sylvan::Bdd dd = Cnf2Bdd(f);
    
    pm = probsFromFile(path + ".cnf_probs");
    printProbMap(pm);

    FILE *fp = fopen("wpbdd.dot", "w");
    dd.PrintDot(fp);
    fclose(fp);

    double count = wpbdd_modelcount(dd.GetBDD());
    std::cout << "model count: " << count << std::endl;

    sylvan::sylvan_quit();
    lace_stop();

    return 0;
}