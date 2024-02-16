#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <iterator>
#include <set>
#include <cmath>
#include <stdlib.h>

#include <bnbdd_inference.hpp>
#include "test_assert.h"

BnBdd bnbdd;

#define assert_close(a,b) test_assert(std::abs(a - b) < 1e-6)


int test_total_wmc()
{
    double p;

    // test the unconstrained Pr(), i.e. the probability that _something_ happens
    p = bnbdd_marginalize(bnbdd, {});
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
    int A = bnbdd.rv_vars[0];
    int B = bnbdd.rv_vars[1];
    int C = bnbdd.rv_vars[2];

    // test Pr(A ^ B ^ C)
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 0}, {C, 0}}); assert_close(p, .2*.3*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 0}, {C, 1}}); assert_close(p, .2*.3*.9);
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 1}, {C, 0}}); assert_close(p, .2*.7*.8);
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 1}, {C, 1}}); assert_close(p, .2*.7*.2);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 0}, {C, 0}}); assert_close(p, .8*.25*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 0}, {C, 1}}); assert_close(p, .8*.25*.9);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 1}, {C, 0}}); assert_close(p, .8*.75*.8);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 1}, {C, 1}}); assert_close(p, .8*.75*.2);

    // test Pr(A), Pr(B), Pr(C)
    p = bnbdd_marginalize(bnbdd, {{A, 0}}); assert_close(p, .2);   // Pr(A = 0)
    p = bnbdd_marginalize(bnbdd, {{A, 1}}); assert_close(p, .8);   // Pr(A = 1)
    p = bnbdd_marginalize(bnbdd, {{B, 0}}); assert_close(p, .26);  // Pr(B = 0)
    p = bnbdd_marginalize(bnbdd, {{B, 1}}); assert_close(p, .74);  // Pr(B = 1)
    p = bnbdd_marginalize(bnbdd, {{C, 0}}); assert_close(p, .618); // Pr(C = 0)
    p = bnbdd_marginalize(bnbdd, {{C, 1}}); assert_close(p, .382); // Pr(C = 1)

    printf("Marginal probs line:                    OK\n");
    return 0;
}

int test_conditionals_line()
{
    double p;
    int A = bnbdd.rv_vars[0];
    int B = bnbdd.rv_vars[1];
    int C = bnbdd.rv_vars[2];

    // direct from CPT of B
    p = bnbdd_condition(bnbdd, {{B, 0}}, {{A, 0}}); assert_close(p, .3);
    p = bnbdd_condition(bnbdd, {{B, 0}}, {{A, 1}}); assert_close(p, .25);
    p = bnbdd_condition(bnbdd, {{B, 1}}, {{A, 0}}); assert_close(p, .7);
    p = bnbdd_condition(bnbdd, {{B, 1}}, {{A, 1}}); assert_close(p, .75);

    // direct from CPT of C
    p = bnbdd_condition(bnbdd, {{C, 0}}, {{B, 0}}); assert_close(p, .1);
    p = bnbdd_condition(bnbdd, {{C, 0}}, {{B, 1}}); assert_close(p, .8);
    p = bnbdd_condition(bnbdd, {{C, 1}}, {{B, 0}}); assert_close(p, .9);
    p = bnbdd_condition(bnbdd, {{C, 1}}, {{B, 1}}); assert_close(p, .2);

    // Pr(A|B) = Pr(B|A)Pr(A)/Pr(B)
    p = bnbdd_condition(bnbdd, {{A, 0}}, {{B, 0}}); assert_close(p, .3*.2/.26);
    p = bnbdd_condition(bnbdd, {{A, 0}}, {{B, 1}}); assert_close(p, .7*.2/.74);
    p = bnbdd_condition(bnbdd, {{A, 1}}, {{B, 0}}); assert_close(p, .25*.8/.26);
    p = bnbdd_condition(bnbdd, {{A, 1}}, {{B, 1}}); assert_close(p, .75*.8/.74);

    // Pr(B|C) = Pr(C|B)Pr(B)/Pr(C)
    p = bnbdd_condition(bnbdd, {{B, 0}}, {{C, 0}}); assert_close(p, .1*.26/.618);
    p = bnbdd_condition(bnbdd, {{B, 0}}, {{C, 1}}); assert_close(p, .9*.26/.382);
    p = bnbdd_condition(bnbdd, {{B, 1}}, {{C, 0}}); assert_close(p, .8*.74/.618);
    p = bnbdd_condition(bnbdd, {{B, 1}}, {{C, 1}}); assert_close(p, .2*.74/.382);

    printf("Conditional probs line:                 OK\n");
    return 0;
}

int test_do_operator_line()
{
    double p;
    int A = bnbdd.rv_vars[0];
    int B = bnbdd.rv_vars[1];
    int C = bnbdd.rv_vars[2];

    // Pr(A|do(B)) = Pr(A) (last argument is parents of B)
    // naive implementation
    p = bnbdd_do_naive(bnbdd, {{A, 0}}, {{B, 0}}, {A});   assert_close(p, .2);
    p = bnbdd_do_naive(bnbdd, {{A, 0}}, {{B, 1}}, {A});   assert_close(p, .2);
    p = bnbdd_do_naive(bnbdd, {{A, 1}}, {{B, 0}}, {A});   assert_close(p, .8);
    p = bnbdd_do_naive(bnbdd, {{A, 1}}, {{B, 1}}, {A});   assert_close(p, .8);
    // covariate adjustment operator (what is the minimal adjustment set here?)
    //p = bnbdd_do_cov_adj(bnbdd, {{A, 0}}, {{B, 0}}, {B});   assert_close(p, .2);
    //p = bnbdd_do_cov_adj(bnbdd, {{A, 0}}, {{B, 1}}, {B});   assert_close(p, .2);
    //p = bnbdd_do_cov_adj(bnbdd, {{A, 1}}, {{B, 0}}, {B});   assert_close(p, .8);
    //p = bnbdd_do_cov_adj(bnbdd, {{A, 1}}, {{B, 1}}, {B});   assert_close(p, .8);

    // Pr(B|do(A)) = Pr(B|A)
    // naive implementation
    p = bnbdd_do_naive(bnbdd, {{B, 0}}, {{A, 0}}, {});   assert_close(p, .3);
    p = bnbdd_do_naive(bnbdd, {{B, 0}}, {{A, 1}}, {});   assert_close(p, .25);
    p = bnbdd_do_naive(bnbdd, {{B, 1}}, {{A, 0}}, {});   assert_close(p, .7);
    p = bnbdd_do_naive(bnbdd, {{B, 1}}, {{A, 1}}, {});   assert_close(p, .75);
    // covariate adjustment operator
    p = bnbdd_do_cov_adj(bnbdd, {{B, 0}}, {{A, 0}}, {});   assert_close(p, .3);
    p = bnbdd_do_cov_adj(bnbdd, {{B, 0}}, {{A, 1}}, {});   assert_close(p, .25);
    p = bnbdd_do_cov_adj(bnbdd, {{B, 1}}, {{A, 0}}, {});   assert_close(p, .7);
    p = bnbdd_do_cov_adj(bnbdd, {{B, 1}}, {{A, 1}}, {});   assert_close(p, .75);

    // Pr(C|do(B)) = Pr(C|B)
    // naive implementation
    p = bnbdd_do_naive(bnbdd, {{C, 0}}, {{B, 0}}, {A});   assert_close(p, .1);
    p = bnbdd_do_naive(bnbdd, {{C, 0}}, {{B, 1}}, {A});   assert_close(p, .8);
    p = bnbdd_do_naive(bnbdd, {{C, 1}}, {{B, 0}}, {A});   assert_close(p, .9);
    p = bnbdd_do_naive(bnbdd, {{C, 1}}, {{B, 1}}, {A});   assert_close(p, .2);
    // covariate adjustment operator
    p = bnbdd_do_cov_adj(bnbdd, {{C, 0}}, {{B, 0}}, {A});   assert_close(p, .1);
    p = bnbdd_do_cov_adj(bnbdd, {{C, 0}}, {{B, 1}}, {A});   assert_close(p, .8);
    p = bnbdd_do_cov_adj(bnbdd, {{C, 1}}, {{B, 0}}, {A});   assert_close(p, .9);
    p = bnbdd_do_cov_adj(bnbdd, {{C, 1}}, {{B, 1}}, {A});   assert_close(p, .2);

    // TODO: more

    printf("Do-operator probs line:                 OK\n");
    return 0;
}

int test_marginals_line2()
{
    double p;
    int A = bnbdd.rv_vars[0];
    int B = bnbdd.rv_vars[1];
    int C = bnbdd.rv_vars[2];

    // test Pr(A ^ B ^ C)
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 0}, {C, 0}}); assert_close(p, .5*.3*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 0}, {C, 1}}); assert_close(p, .5*.3*.9);
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 1}, {C, 0}}); assert_close(p, .5*.7*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 1}, {C, 1}}); assert_close(p, .5*.7*.9);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 0}, {C, 0}}); assert_close(p, .5*.5*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 0}, {C, 1}}); assert_close(p, .5*.5*.9);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 1}, {C, 0}}); assert_close(p, .5*.5*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 1}, {C, 1}}); assert_close(p, .5*.5*.9);

    // test Pr(A), Pr(B), Pr(C)
    p = bnbdd_marginalize(bnbdd, {{A, 0}}); assert_close(p, .5);  // Pr(A = 0)
    p = bnbdd_marginalize(bnbdd, {{A, 1}}); assert_close(p, .5);  // Pr(A = 1)
    p = bnbdd_marginalize(bnbdd, {{B, 0}}); assert_close(p, .4);  // Pr(B = 0)
    p = bnbdd_marginalize(bnbdd, {{B, 1}}); assert_close(p, .6);  // Pr(B = 1)
    p = bnbdd_marginalize(bnbdd, {{C, 0}}); assert_close(p, .1);  // Pr(C = 0)
    p = bnbdd_marginalize(bnbdd, {{C, 1}}); assert_close(p, .9);  // Pr(C = 1)

    printf("Marginal probs line2 (merged):          OK\n");
    return 0;
}

int test_conditionals_line2()
{
    double p;
    int A = bnbdd.rv_vars[0];
    int B = bnbdd.rv_vars[1];
    int C = bnbdd.rv_vars[2];

    // direct from CPT of B
    p = bnbdd_condition(bnbdd, {{B, 0}}, {{A, 0}}); assert_close(p, .3);
    p = bnbdd_condition(bnbdd, {{B, 0}}, {{A, 1}}); assert_close(p, .5);
    p = bnbdd_condition(bnbdd, {{B, 1}}, {{A, 0}}); assert_close(p, .7);
    p = bnbdd_condition(bnbdd, {{B, 1}}, {{A, 1}}); assert_close(p, .5);

    // direct from CPT of A
    p = bnbdd_condition(bnbdd, {{C, 0}}, {{B, 0}}); assert_close(p, .1);
    p = bnbdd_condition(bnbdd, {{C, 0}}, {{B, 1}}); assert_close(p, .1);
    p = bnbdd_condition(bnbdd, {{C, 1}}, {{B, 0}}); assert_close(p, .9);
    p = bnbdd_condition(bnbdd, {{C, 1}}, {{B, 1}}); assert_close(p, .9);

    printf("Conditional probs line2 (merged):       OK\n");
    return 0;
}

int test_marginals_line3()
{
    double p;
    int A = bnbdd.rv_vars[0];
    int B = bnbdd.rv_vars[1];
    int C = bnbdd.rv_vars[2];

    // test Pr(A ^ B ^ C)
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 0}, {C, 0}}); assert_close(p, .5*.3*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 0}, {C, 1}}); assert_close(p, .5*.3*.9);
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 1}, {C, 0}}); assert_close(p, .5*.7*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 0}, {B, 1}, {C, 1}}); assert_close(p, .5*.7*.9);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 0}, {C, 0}}); assert_close(p, .5*.5*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 0}, {C, 1}}); assert_close(p, .5*.5*.9);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 1}, {C, 0}}); assert_close(p, .5*.5*.1);
    p = bnbdd_marginalize(bnbdd, {{A, 1}, {B, 1}, {C, 1}}); assert_close(p, .5*.5*.9);

    // test Pr(A), Pr(B), Pr(C)
    p = bnbdd_marginalize(bnbdd, {{A, 0}}); assert_close(p, .5);  // Pr(A = 0)
    p = bnbdd_marginalize(bnbdd, {{A, 1}}); assert_close(p, .5);  // Pr(A = 1)
    p = bnbdd_marginalize(bnbdd, {{B, 0}}); assert_close(p, .4);  // Pr(B = 0)
    p = bnbdd_marginalize(bnbdd, {{B, 1}}); assert_close(p, .6);  // Pr(B = 1)
    p = bnbdd_marginalize(bnbdd, {{C, 0}}); assert_close(p, .1);  // Pr(C = 0)
    p = bnbdd_marginalize(bnbdd, {{C, 1}}); assert_close(p, .9);  // Pr(C = 1)

    printf("Marginal probs line3 (interleaved):     OK\n");
    return 0;
}

int test_conditionals_line3()
{
    double p;
    int A = bnbdd.rv_vars[0];
    int B = bnbdd.rv_vars[1];
    int C = bnbdd.rv_vars[2];

    // direct from CPT of B
    p = bnbdd_condition(bnbdd, {{B, 0}}, {{A, 0}}); assert_close(p, .3);
    p = bnbdd_condition(bnbdd, {{B, 0}}, {{A, 1}}); assert_close(p, .5);
    p = bnbdd_condition(bnbdd, {{B, 1}}, {{A, 0}}); assert_close(p, .7);
    p = bnbdd_condition(bnbdd, {{B, 1}}, {{A, 1}}); assert_close(p, .5);

    // direct from CPT of A
    p = bnbdd_condition(bnbdd, {{C, 0}}, {{B, 0}}); assert_close(p, .1);
    p = bnbdd_condition(bnbdd, {{C, 0}}, {{B, 1}}); assert_close(p, .1);
    p = bnbdd_condition(bnbdd, {{C, 1}}, {{B, 0}}); assert_close(p, .9);
    p = bnbdd_condition(bnbdd, {{C, 1}}, {{B, 1}}); assert_close(p, .9);

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
    bnbdd = bnbdd_from_files(path);
    printf("\tnodecount = %ld\n", bnbdd.dd.NodeCount());
    printf("\ttotal WMC = %lf\n", bnbdd_marginalize(bnbdd, {}));
    printf("\tmarginal probs:\n");
    double t0 = bnbdd_marginalize(bnbdd, {{T, 0}});
    double t1 = bnbdd_marginalize(bnbdd, {{T, 1}});
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
    bnbdd = bnbdd_from_files(path);
    printf("\tnodecount   = %ld\n", bnbdd.dd.NodeCount());
    printf("\ttotal WMC   = %lf\n", bnbdd_marginalize(bnbdd, {}));

    // Compute sum_{a} Pr(A=a) (should be 1.0)
    double PrA = 0;
    for (int a = 0; a < 1<<5; a++) {
        PrA += bnbdd_marginalize(bnbdd, constrain({A4, A3, A2, A1, A0}, a));
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
    bnbdd = bnbdd_from_files(path);
    printf("\tnodecount = %ld\n", bnbdd.dd.NodeCount());
    printf("\ttotal WMC = %lf\n", bnbdd_marginalize(bnbdd, {}));

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
    bnbdd = bnbdd_from_files("models/toy_networks/line");
    if (test_total_wmc()) return 1;
    if (test_marginals_line()) return 1;
    if (test_conditionals_line()) return 1;
    if (test_do_operator_line()) return 1;

    // test line BD where there are duplicate probabilities are merged
    bnbdd = bnbdd_from_files("models/toy_networks/line2");
    if (test_total_wmc()) return 1;
    if (test_marginals_line2()) return 1;
    if (test_conditionals_line2()) return 1;

    // test slightly bigger network
    bnbdd = bnbdd_from_files("models/toy_networks/student");
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
