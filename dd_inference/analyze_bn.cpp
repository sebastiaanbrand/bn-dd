#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <iterator>
#include <set>
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

static double t_start;
#define INFO(s, ...) fprintf(stdout, "[% 8.2f] " s, wctime()-t_start, ##__VA_ARGS__)
#define Abort(...) { fprintf(stderr, __VA_ARGS__); fprintf(stderr, "Abort at line %d!\n", __LINE__); exit(-1); }


static int max_var;

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



void small_example()
{
    // hardcoded example from 2016, Dal, p.5-6
    enum {blank, a1, a2, w1, b1, b2, b3, w2, w3};

    Cnf f = {{a1, a2}, {-a1, -a2}, 
             {b1, b2, b3}, {-b1, -b2}, {-b1, -b3}, {-b2, -b3},
             {-a1, w1}, {-a2, w2},
             {-a1, -b1, w2}, {-a1, -b2, w2}, {-a1, -b1, w2},
             {-a1, -b2, w2}, {-a1, -b3, w3}, {-a2, -b3, w3}};

    sylvan::Bdd b = cnf_to_bdd(f);

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

int main(int argc, char** argv)
{
    std::string path;
    if (argc == 2) {
        path = argv[1];
    } else {
        std::cout << "Please specify an input file (without .cnf)" << std::endl;
        exit(1);
    }

    t_start = wctime();

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

    WpBdd wpbdd = wpbdd_from_files(path);
    uint64_t nodecount = sylvan::sylvan_nodecount(wpbdd.dd.GetBDD());
    INFO("WPBDD nodecount = %ld\n", nodecount);

    
    /*
    FILE *fp = fopen("wpbdd.dot", "w");
    wpbdd.dd.PrintDot(fp);
    fclose(fp);

    std::vector<int> rv_vars{1, 2, 3};
    computeAllProbs(wpbdd);
    VarConstraint a{{1, marg_0}, {2, marg_1}, {3, marg_1}};
    wpbdd_marginals(wpbdd, a);
    marinalizeIndividual(wpbdd);
    conditionPairs(wpbdd);

    sylvan::sylvan_quit();
    lace_stop();
    */

    return 0;
}
