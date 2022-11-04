#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <iterator>
#include <set>
#include <cmath>
#include <stdlib.h>

#include <wpbdd_inference.hpp>

WpBdd wpbdd;

#define assert_close(a,b) assert(std::abs(a - b) < 1e-6)
/*
void assert_close(double a, double b)
{
    if (std::abs(a - b) > 1e-6){
        printf("Found:    %0.10lf\n", a);
        printf("Expected: %0.10lf\n", b);
        assert(false && "value not close");
    }
}
*/

int test_marginals_line()
{
    double p;
    int A = 1, B = 2, C = 3; // RV vars

    p = wpbdd_marginalize(wpbdd, {{A, 0}}); assert_close(p, .2);   // Pr(A = 0)
    p = wpbdd_marginalize(wpbdd, {{A, 1}}); assert_close(p, .8);   // Pr(A = 1)
    p = wpbdd_marginalize(wpbdd, {{B, 0}}); assert_close(p, .26);  // Pr(B = 0)
    p = wpbdd_marginalize(wpbdd, {{B, 1}}); assert_close(p, .74);  // Pr(B = 1)
    p = wpbdd_marginalize(wpbdd, {{C, 0}}); assert_close(p, .618); // Pr(C = 0)
    p = wpbdd_marginalize(wpbdd, {{C, 1}}); assert_close(p, .382); // Pr(C = 1)

    printf("Marginal probs line:                OK\n");
    return 0;
}

int test_conditionals_line()
{
    double p;
    int A = 1, B = 2, C = 3; // RV vars

    // direct from CPT of B
    p = wpbdd_condition(wpbdd, {{B, 0}}, {{A, 0}}); assert_close(p, .3);
    p = wpbdd_condition(wpbdd, {{B, 0}}, {{A, 1}}); assert_close(p, .25);
    p = wpbdd_condition(wpbdd, {{B, 1}}, {{A, 0}}); assert_close(p, .7);
    p = wpbdd_condition(wpbdd, {{B, 1}}, {{A, 1}}); assert_close(p, .75);

    // direct from CPT of A
    p = wpbdd_condition(wpbdd, {{C, 0}}, {{B, 0}}); assert_close(p, .1);
    p = wpbdd_condition(wpbdd, {{C, 0}}, {{B, 1}}); assert_close(p, .8);
    p = wpbdd_condition(wpbdd, {{C, 1}}, {{B, 0}}); assert_close(p, .9);
    p = wpbdd_condition(wpbdd, {{C, 1}}, {{B, 1}}); assert_close(p, .2);

    // Pr(A|B) = Pr(B|A)Pr(A)/Pr(B)
    p = wpbdd_condition(wpbdd, {{A, 0}}, {{B, 0}}); assert_close(p, .3*.2/.26);
    p = wpbdd_condition(wpbdd, {{A, 0}}, {{B, 1}}); assert_close(p, .7*.2/.74);
    p = wpbdd_condition(wpbdd, {{A, 1}}, {{B, 0}}); assert_close(p, .25*.8/.26);
    p = wpbdd_condition(wpbdd, {{A, 1}}, {{B, 1}}); assert_close(p, .75*.8/.74);

    // Pr(B|C) = Pr(C|B)Pr(B)/Pr(C)
    p = wpbdd_condition(wpbdd, {{B, 0}}, {{C, 0}}); assert_close(p, .1*.26/.618);
    p = wpbdd_condition(wpbdd, {{B, 0}}, {{C, 1}}); assert_close(p, .9*.26/.382);
    p = wpbdd_condition(wpbdd, {{B, 1}}, {{C, 0}}); assert_close(p, .8*.74/.618);
    p = wpbdd_condition(wpbdd, {{B, 1}}, {{C, 1}}); assert_close(p, .2*.74/.382);

    printf("Conditional probs line:             OK\n");
    return 0;
}

int test_do_operator_line()
{
    // TODO
    return 0;
}

int main(int argc, char** argv)
{

    // Standard Lace initialization with 1 worker
    lace_start(1, 0);

    // Simple Sylvan initialization, also initialize BDD support
    sylvan::sylvan_set_sizes(1LL<<16, 1LL<<16, 1LL<<16, 1LL<<16);
    sylvan::sylvan_init_package();
    sylvan::sylvan_init_bdd();

    // WIP: test line BN
    wpbdd = wpbdd_from_files("models/line");
    if (test_marginals_line()) return 1;
    if (test_conditionals_line()) return 1;
    if (test_do_operator_line()) return 1;

    sylvan::sylvan_quit();
    lace_stop();

    return 0;
}
