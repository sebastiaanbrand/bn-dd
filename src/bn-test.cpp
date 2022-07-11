#include <iostream>
#include <iterator>
#include <set>
#include <stdlib.h>

#include <sylvan.h>
#include <sylvan_obj.hpp>

typedef std::set<std::set<int>> Cnf;

using namespace sylvan;

Bdd Cnf2Bdd(Cnf f)
{
    Bdd res = Bdd::bddOne();

    for (auto clause : f){
        Bdd c = Bdd::bddZero();

        for (int lit : clause) {
            Bdd l = Bdd::bddVar(abs(lit));
            if (lit < 0) l = !l;
            c = c | l;
        }

        res = res & c;
    }
    
    return res;
}

int main() {
    std::cout << "Hello there!" << std::endl;

    // Standard Lace initialization with 1 worker
    lace_start(1, 0);

    // Simple Sylvan initialization, also initialize BDD support
    sylvan_set_sizes(1LL<<16, 1LL<<16, 1LL<<16, 1LL<<16);
    sylvan_init_package();
    sylvan_init_bdd();


    Cnf f = {{1, 2, 3}, {1, 2, -3}, {1, -2, -3}};
    Bdd b = Cnf2Bdd(f);
    std::cout << "satcount: " << b.SatCount(3) << std::endl;

    sylvan_quit();
    lace_stop();

    return 0;
}
