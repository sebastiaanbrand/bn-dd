#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <iterator>
#include <set>
#include <stdlib.h>

#include <wpbdd_inference.hpp>

int main(int argc, char** argv) {

    // Standard Lace initialization with 1 worker
    lace_start(1, 0);

    // Simple Sylvan initialization, also initialize BDD support
    sylvan::sylvan_set_sizes(1LL<<16, 1LL<<16, 1LL<<16, 1LL<<16);
    sylvan::sylvan_init_package();
    sylvan::sylvan_init_bdd();

    // TODO: write some tests for small BNs for which we can compute probs by hand

    sylvan::sylvan_quit();
    lace_stop();

    return 0;
}
