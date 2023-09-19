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


int test_total_wmc()
{
    double p;

    // test the unconstrained Pr(), i.e. the probability that _something_ happens
    p = wpbdd_marginalize(wpbdd, {});
    assert_close(p, 1.0);

    printf("Total WMC:                              OK\n");
    return 0;
}


int test_marginals_line()
{
    double p;
    int A = wpbdd.rv_vars[0];
    int B = wpbdd.rv_vars[1];
    int C = wpbdd.rv_vars[2];

    // test Pr(A ^ B ^ C)
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 0}, {C, 0}}); assert_close(p, .2*.3*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 0}, {C, 1}}); assert_close(p, .2*.3*.9);
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 1}, {C, 0}}); assert_close(p, .2*.7*.8);
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 1}, {C, 1}}); assert_close(p, .2*.7*.2);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 0}, {C, 0}}); assert_close(p, .8*.25*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 0}, {C, 1}}); assert_close(p, .8*.25*.9);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 1}, {C, 0}}); assert_close(p, .8*.75*.8);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 1}, {C, 1}}); assert_close(p, .8*.75*.2);

    // test Pr(A), Pr(B), Pr(C)
    p = wpbdd_marginalize(wpbdd, {{A, 0}}); assert_close(p, .2);   // Pr(A = 0)
    p = wpbdd_marginalize(wpbdd, {{A, 1}}); assert_close(p, .8);   // Pr(A = 1)
    p = wpbdd_marginalize(wpbdd, {{B, 0}}); assert_close(p, .26);  // Pr(B = 0)
    p = wpbdd_marginalize(wpbdd, {{B, 1}}); assert_close(p, .74);  // Pr(B = 1)
    p = wpbdd_marginalize(wpbdd, {{C, 0}}); assert_close(p, .618); // Pr(C = 0)
    p = wpbdd_marginalize(wpbdd, {{C, 1}}); assert_close(p, .382); // Pr(C = 1)

    printf("Marginal probs line:                    OK\n");
    return 0;
}

int test_conditionals_line()
{
    double p;
    int A = wpbdd.rv_vars[0];
    int B = wpbdd.rv_vars[1];
    int C = wpbdd.rv_vars[2];

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

    printf("Conditional probs line:                 OK\n");
    return 0;
}

int test_do_operator_line()
{
    double p;
    int A = wpbdd.rv_vars[0];
    int B = wpbdd.rv_vars[1];
    int C = wpbdd.rv_vars[2];

    // Pr(A|do(B)) = Pr(A) (last argument is parents of B)
    p = wpbdd_do(wpbdd, {{A, 0}}, {{B, 0}}, {A});   assert_close(p, .2);
    p = wpbdd_do(wpbdd, {{A, 0}}, {{B, 1}}, {A});   assert_close(p, .2);
    p = wpbdd_do(wpbdd, {{A, 1}}, {{B, 0}}, {A});   assert_close(p, .8);
    p = wpbdd_do(wpbdd, {{A, 1}}, {{B, 1}}, {A});   assert_close(p, .8);

    // Pr(B|do(A)) = Pr(B|A)
    p = wpbdd_do(wpbdd, {{B, 0}}, {{A, 0}}, {A});   assert_close(p, .3);
    p = wpbdd_do(wpbdd, {{B, 0}}, {{A, 1}}, {A});   assert_close(p, .25);
    p = wpbdd_do(wpbdd, {{B, 1}}, {{A, 0}}, {A});   assert_close(p, .7);
    p = wpbdd_do(wpbdd, {{B, 1}}, {{A, 1}}, {A});   assert_close(p, .75);

    // TODO: more

    printf("Do-operator probs line:                 OK\n");
    return 0;
}

int test_marginals_line2()
{
    double p;
    int A = wpbdd.rv_vars[0];
    int B = wpbdd.rv_vars[1];
    int C = wpbdd.rv_vars[2];

    // test Pr(A ^ B ^ C)
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 0}, {C, 0}}); assert_close(p, .5*.3*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 0}, {C, 1}}); assert_close(p, .5*.3*.9);
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 1}, {C, 0}}); assert_close(p, .5*.7*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 1}, {C, 1}}); assert_close(p, .5*.7*.9);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 0}, {C, 0}}); assert_close(p, .5*.5*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 0}, {C, 1}}); assert_close(p, .5*.5*.9);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 1}, {C, 0}}); assert_close(p, .5*.5*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 1}, {C, 1}}); assert_close(p, .5*.5*.9);

    // test Pr(A), Pr(B), Pr(C)
    p = wpbdd_marginalize(wpbdd, {{A, 0}}); assert_close(p, .5);  // Pr(A = 0)
    p = wpbdd_marginalize(wpbdd, {{A, 1}}); assert_close(p, .5);  // Pr(A = 1)
    p = wpbdd_marginalize(wpbdd, {{B, 0}}); assert_close(p, .4);  // Pr(B = 0)
    p = wpbdd_marginalize(wpbdd, {{B, 1}}); assert_close(p, .6);  // Pr(B = 1)
    p = wpbdd_marginalize(wpbdd, {{C, 0}}); assert_close(p, .1);  // Pr(C = 0)
    p = wpbdd_marginalize(wpbdd, {{C, 1}}); assert_close(p, .9);  // Pr(C = 1)

    printf("Marginal probs line2 (merged):          OK\n");
    return 0;
}

int test_conditionals_line2()
{
    double p;
    int A = wpbdd.rv_vars[0];
    int B = wpbdd.rv_vars[1];
    int C = wpbdd.rv_vars[2];

    // direct from CPT of B
    p = wpbdd_condition(wpbdd, {{B, 0}}, {{A, 0}}); assert_close(p, .3);
    p = wpbdd_condition(wpbdd, {{B, 0}}, {{A, 1}}); assert_close(p, .5);
    p = wpbdd_condition(wpbdd, {{B, 1}}, {{A, 0}}); assert_close(p, .7);
    p = wpbdd_condition(wpbdd, {{B, 1}}, {{A, 1}}); assert_close(p, .5);

    // direct from CPT of A
    p = wpbdd_condition(wpbdd, {{C, 0}}, {{B, 0}}); assert_close(p, .1);
    p = wpbdd_condition(wpbdd, {{C, 0}}, {{B, 1}}); assert_close(p, .1);
    p = wpbdd_condition(wpbdd, {{C, 1}}, {{B, 0}}); assert_close(p, .9);
    p = wpbdd_condition(wpbdd, {{C, 1}}, {{B, 1}}); assert_close(p, .9);

    printf("Conditional probs line2 (merged):       OK\n");
    return 0;
}

int test_marginals_line3()
{
    double p;
    int A = wpbdd.rv_vars[0];
    int B = wpbdd.rv_vars[1];
    int C = wpbdd.rv_vars[2];

    // test Pr(A ^ B ^ C)
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 0}, {C, 0}}); assert_close(p, .5*.3*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 0}, {C, 1}}); assert_close(p, .5*.3*.9);
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 1}, {C, 0}}); assert_close(p, .5*.7*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 0}, {B, 1}, {C, 1}}); assert_close(p, .5*.7*.9);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 0}, {C, 0}}); assert_close(p, .5*.5*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 0}, {C, 1}}); assert_close(p, .5*.5*.9);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 1}, {C, 0}}); assert_close(p, .5*.5*.1);
    p = wpbdd_marginalize(wpbdd, {{A, 1}, {B, 1}, {C, 1}}); assert_close(p, .5*.5*.9);

    // test Pr(A), Pr(B), Pr(C)
    p = wpbdd_marginalize(wpbdd, {{A, 0}}); assert_close(p, .5);  // Pr(A = 0)
    p = wpbdd_marginalize(wpbdd, {{A, 1}}); assert_close(p, .5);  // Pr(A = 1)
    p = wpbdd_marginalize(wpbdd, {{B, 0}}); assert_close(p, .4);  // Pr(B = 0)
    p = wpbdd_marginalize(wpbdd, {{B, 1}}); assert_close(p, .6);  // Pr(B = 1)
    p = wpbdd_marginalize(wpbdd, {{C, 0}}); assert_close(p, .1);  // Pr(C = 0)
    p = wpbdd_marginalize(wpbdd, {{C, 1}}); assert_close(p, .9);  // Pr(C = 1)

    printf("Marginal probs line3 (interleaved):     OK\n");
    return 0;
}

int test_conditionals_line3()
{
    double p;
    int A = wpbdd.rv_vars[0];
    int B = wpbdd.rv_vars[1];
    int C = wpbdd.rv_vars[2];

    // direct from CPT of B
    p = wpbdd_condition(wpbdd, {{B, 0}}, {{A, 0}}); assert_close(p, .3);
    p = wpbdd_condition(wpbdd, {{B, 0}}, {{A, 1}}); assert_close(p, .5);
    p = wpbdd_condition(wpbdd, {{B, 1}}, {{A, 0}}); assert_close(p, .7);
    p = wpbdd_condition(wpbdd, {{B, 1}}, {{A, 1}}); assert_close(p, .5);

    // direct from CPT of A
    p = wpbdd_condition(wpbdd, {{C, 0}}, {{B, 0}}); assert_close(p, .1);
    p = wpbdd_condition(wpbdd, {{C, 0}}, {{B, 1}}); assert_close(p, .1);
    p = wpbdd_condition(wpbdd, {{C, 1}}, {{B, 0}}); assert_close(p, .9);
    p = wpbdd_condition(wpbdd, {{C, 1}}, {{B, 1}}); assert_close(p, .9);

    printf("Conditional probs line3 (interleaved):  OK\n");
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

    // test line BN
    wpbdd = wpbdd_from_files("models/toy_networks/line");
    if (test_total_wmc()) return 1;
    if (test_marginals_line()) return 1;
    if (test_conditionals_line()) return 1;
    if (test_do_operator_line()) return 1;

    // test line BD where there are duplicate probabilities are merged
    wpbdd = wpbdd_from_files("models/toy_networks/line2");
    if (test_total_wmc()) return 1;
    if (test_marginals_line2()) return 1;
    if (test_conditionals_line2()) return 1;

    // test slightly bigger network
    wpbdd = wpbdd_from_files("models/toy_networks/student");
    if (test_total_wmc()) return 1;

    sylvan::sylvan_quit();
    lace_stop();

    return 0;
}
