#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <iterator>
#include <set>
#include <cmath>
#include <stdlib.h>

#include <wpbdd_inference.hpp>
#include "test_assert.h"

WpBdd wpbdd;

#define assert_close(a,b) test_assert(std::abs(a - b) < 1e-6)


int test_total_wmc()
{
    double p;

    // test the unconstrained Pr(), i.e. the probability that _something_ happens
    p = wpbdd_marginalize(wpbdd, {});
    assert_close(p, 1.0);

    printf("Total WMC:                              OK\n");
    return 0;
}


int test_constrain()
{
    int x4 = 4, x3 = 3, x2 = 2;

    Constraint x_is_5 = constrain({x4, x3, x2}, 5); // 5 = 101 = true,false,true
    test_assert(x_is_5.size() == 3);
    for (auto c : x_is_5) {
        if (c.first == 4) test_assert(c.second == true);
        if (c.first == 3) test_assert(c.second == false);
        if (c.first == 2) test_assert(c.second == true);
    }

    printf("Test constrain(bool_vars, int_val):     OK\n");
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


// test causal quadratic EV30
int test_causal_quadratic_EV30()
{
    /**
     * rv vars:
     * T 8
     * Y 59 60 61 62 63
     * Z 1 2 3 4 5
     * 
     * structure:
     * 
     *  Y <-- T
     *  ^     ^
     *  |    /
     *  Z -/
    */
    int T = 8;
    int Y0 = 59, Y1 = 60, Y2 = 61, Y3 = 62, Y4 = 63;
    int Z0 = 1, Z1 = 2, Z2 = 3, Z3 = 4, Z4 = 5;

    printf("\nTesting causal quadratic EV30\n");
    std::string path = "models/tests/causal_quadratic_EV30/data_causal_quadratic_EV30";
    wpbdd = wpbdd_from_files(path);
    printf("\tnodecount = %ld\n", wpbdd.dd.NodeCount());
    printf("\ttotal WMC = %lf\n", wpbdd_marginalize(wpbdd, {}));
    printf("\tmarginal probs:\n");
    double t0 = wpbdd_marginalize(wpbdd, {{T, 0}});
    double t1 = wpbdd_marginalize(wpbdd, {{T, 1}});
    printf("\t  Pr(T=0) = %lf\n", t0);
    printf("\t  Pr(T=1) = %lf\n", t1);
    printf("\t  Pr(T)   = %lf\n", t0 + t1);

    return 0;
}


// test linear gaussian EV30
int test_linear_gaussian_EV30()
{
    /**
     * rv vars:
     * A 1 2 3 4 5
     * D 22 23 24 25 26
     * B 8 9 10 11 12
     * E 69 70 71 72 73
     * C 15 16 17 18 19
     * 
     * structure:
     * 
     *  A --> D --> E
     *        ^     ^
     *        |     |
     *        B     C
    */
   int A4 = 1, A3 = 2, A2 = 3, A1 = 4, A0 = 5;

    printf("\nTesting linear gaussian EV30\n");
    std::string path = "models/tests/lg_EV30/data_lg_EV30";
    wpbdd = wpbdd_from_files(path);
    printf("\tnodecount   = %ld\n", wpbdd.dd.NodeCount());
    printf("\ttotal WMC   = %lf\n", wpbdd_marginalize(wpbdd, {}));

    // Compute sum_{a} Pr(A=a) (should be 1.0)
    double PrA = 0;
    for (int a = 0; a < 1<<5; a++) {
        PrA += wpbdd_marginalize(wpbdd, constrain({A4, A3, A2, A1, A0}, a));
    }
    printf("\tsum Pr(A=a) = %lf\n", PrA);

    return 0;
}


// test normal mixture model EB30
int test_normal_mixture_model_EB30()
{
    /**
     * rv vars:
     * X 1
     * Y 4 5 6 7 8
     * 
     * structure:
     * 
     *  X --> Y
    */

    printf("\nTesting normal mixture model EB30\n");
    std::string path = "models/tests/nm_EB30/data_nm_EB30";
    wpbdd = wpbdd_from_files(path);
    printf("\tnodecount = %ld\n", wpbdd.dd.NodeCount());
    printf("\ttotal WMC = %lf\n", wpbdd_marginalize(wpbdd, {}));

    return 0;
}


int test_toy()
{
    // Standard Lace initialization with 1 worker
    lace_start(1, 0);

    // Simple Sylvan initialization, also initialize BDD support
    sylvan::sylvan_set_sizes(1LL<<16, 1LL<<16, 1LL<<16, 1LL<<16);
    sylvan::sylvan_init_package();
    sylvan::sylvan_init_bdd();

    // test constrain function
    if (test_constrain()) return 1;

    // test line BN
    printf("\nTesting toy networks:\n");
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


int test_bigger()
{
    // Standard Lace initialization with 1 worker
    lace_start(1, 0);

    // Simple Sylvan initialization, also initialize BDD support
    sylvan::sylvan_set_sizes(1LL<<23, 1LL<<23, 1LL<<16, 1LL<<16);
    sylvan::sylvan_init_package();
    sylvan::sylvan_init_bdd();

    // test bigger networks
    test_causal_quadratic_EV30();
    test_linear_gaussian_EV30();
    test_normal_mixture_model_EB30();

    sylvan::sylvan_quit();
    lace_stop();

    return 0;
}


int main(int argc, char** argv)
{
    test_toy();
    test_bigger();
}
