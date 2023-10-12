#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <iterator>
#include <set>
#include <stdlib.h>
#include <sys/time.h>

#include <bnbdd_inference.hpp>

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
typedef struct stats {
    size_t nodecount;
    size_t peaknodes;
    double load_time; // time from file reading to DD
    double build_time; // only includes loaded CNF --> DD
    double wmc_time;
    double wmc_value;
    double bn2cnf_time; // time from BN --> CNF (should be much less than build_time)
} stats_t;
stats_t stats = {0};
static int trackpeak = 1; // count peak nodes (every #clauses/100 clauses)


void write_stats(std::string output_file)
{
    std::ofstream f;
    f.open(output_file, std::ios::out);
    f << "{" << std::endl;
    f <<    "\t\"nodecount\" : " << stats.nodecount << "," << std::endl;
    f <<    "\t\"peaknodes\" : " << stats.peaknodes << "," << std::endl;
    f <<    "\t\"total_load_time\" : " << stats.load_time << "," << std::endl;
    f <<    "\t\"build_time\" : " << stats.build_time << "," << std::endl;
    f <<    "\t\"wmc_time\" : "  << stats.wmc_time  << "," << std::endl;
    f <<    "\t\"wmc_value\" : "  << stats.wmc_value  << "," << std::endl;
    f <<    "\t\"bn_to_cnf_time\" : " << stats.bn2cnf_time << std::endl;
    f << "}" << std::endl;
    f.close();
}


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


double bnbdd_marginals(BnBdd bnbdd, VarConstraint part_constraint)
{
    int meta[bnbdd.nvars];
    // by default marginalize vars out
    for (int i = 0; i < bnbdd.nvars; i++) {
        meta[i] = marg_out;
    }

    // mark probability vars as no_rv_vars
    for (auto const& v : bnbdd.pm) {
        meta[v.first] = no_rv_var;
    }

    // add the given (partial) constraint
    for (auto const& a : part_constraint) {
        meta[a.first] = a.second;
    }

    printMeta(meta, bnbdd.nvars);
    std::cout << std::endl;

    return bnbdd_modelcount(bnbdd.dd.GetBDD(), meta, &(bnbdd.pm), &(bnbdd.rv_vars));
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

    sylvan::Bdd b = cnf_to_bdd(f, 0);

    FILE *fp = fopen("small_example.dot", "w");
    b.PrintDot(fp);
    fclose(fp);

}


void _computeAllProbsRec(BnBdd bnbdd, int *meta, int i)
{
    if (i == bnbdd.nvars) {
        // call modelcount here
        double count = bnbdd_modelcount(bnbdd.dd.GetBDD(), meta, &(bnbdd.pm), &(bnbdd.rv_vars));
        sylvan::cache_clear(); // temp, since  meta is not part of the cache key
        printMeta(meta, bnbdd.nvars);
        std::cout << " = " << count << std::endl;
        return;
    }

    if ( std::find(bnbdd.rv_vars.begin(), bnbdd.rv_vars.end(), i) != bnbdd.rv_vars.end() ){
        meta[i] = marg_0;
        _computeAllProbsRec(bnbdd, meta, i + 1);
    
        meta[i] = marg_1;
        _computeAllProbsRec(bnbdd, meta, i + 1);
    }
    else {
        meta[i] = 0;
        _computeAllProbsRec(bnbdd, meta, i + 1);
    }
    
}


void computeAllProbs(BnBdd bnbdd)
{
    int meta[bnbdd.nvars];
    _computeAllProbsRec(bnbdd, meta, 0);
}

void marinalizeIndividual(BnBdd bnbdd)
{
    double prob0, prob1;
    for (int var : bnbdd.rv_vars) {
        prob0 = bnbdd_marginalize(bnbdd, {{var, 0}});
        prob1 = bnbdd_marginalize(bnbdd, {{var, 1}});
        std::cout << "Pr( x" << var << "=0 ) = " << prob0 << std::endl;
        std::cout << "Pr( x" << var << "=1 ) = " << prob1 << std::endl;
    }
}

void conditionPairs(BnBdd bnbdd)
{
    double prob00, prob01, prob10, prob11;
    for (int x : bnbdd.rv_vars) {
        for (int y : bnbdd.rv_vars) {
            if (x != y) {
                prob00 = bnbdd_condition(bnbdd, {{x, 0}}, {{y, 0}});
                prob01 = bnbdd_condition(bnbdd, {{x, 0}}, {{y, 1}});
                prob10 = bnbdd_condition(bnbdd, {{x, 1}}, {{y, 0}});
                prob11 = bnbdd_condition(bnbdd, {{x, 1}}, {{y, 1}});
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
    sylvan::sylvan_set_sizes(1LL<<28, 1LL<<28, 1LL<<16, 1LL<<16);
    sylvan::sylvan_init_package();
    sylvan::sylvan_init_bdd();

    // TODO: maybe it's simpler to just use the C interface of Sylvan?
    // (still in C++ file to make the rest of the programming a bit easier)


    //Cnf f = {{1, 2, 3}, {1, 2, -3}, {1, -2, -3}};
    //Bdd b = Cnf2Bdd(f);
    //std::cout << "satcount: " << b.SatCount(3) << std::endl;
    //small_example();

    INFO("Loading %s\n", path.c_str());
    BnBdd bnbdd = bnbdd_from_files(path, trackpeak);;
    stats.load_time = wctime() - t_start;
    stats.build_time = bnbdd.build_time;
    stats.bn2cnf_time = bnbdd.bn2cnf_time;
    stats.nodecount = sylvan::sylvan_nodecount(bnbdd.dd.GetBDD());
    stats.peaknodes = std::max(bnbdd.peaknodes, stats.nodecount);
    uint64_t full = 1LL<<bnbdd.rv_vars.size();
    INFO("WPBDD nodecount = %ld / %ld = %lf\n", stats.nodecount, full, (double)stats.nodecount / (double)full);

    // time WMC
    t_start = wctime();
    stats.wmc_value = bnbdd_marginalize(bnbdd, {});
    stats.wmc_time = wctime() - t_start;
    INFO("WMC value = %lf\n", stats.wmc_value);

    // write stats to JSON file
    std::string stats_file = path + "_ddinfo.json";
    INFO("Writing stats to %s\n", stats_file.c_str());
    write_stats(stats_file);


    /*
    FILE *fp = fopen("bnbdd.dot", "w");
    bnbdd.dd.PrintDot(fp);
    fclose(fp);

    computeAllProbs(bnbdd);
    marinalizeIndividual(bnbdd);
    conditionPairs(bnbdd);
    */

    sylvan::sylvan_quit();
    lace_stop();

    return 0;
}
