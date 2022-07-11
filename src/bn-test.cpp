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

void small_example()
{
    // hardcoded example from 2016, Dal, p.5-6
    enum {blank, a1, a2, w1, b1, b2, b3, w2, w3};

    Cnf f = {{a1, a2}, {-a1, -a2}, 
             {b1, b2, b3}, {-b1, -b2}, {-b1, -b3}, {-b2, -b3},
             {-a1, w1}, {-a2, w2},
             {-a1, -b1, w2}, {-a1, -b2, w2}, {-a1, -b1, w2},
             {-a1, -b2, w2}, {-a1, -b3, w3}, {-a2, -b3, w3}};

    Bdd b = Cnf2Bdd(f);

    FILE *fp = fopen("small_example.dot", "w");
    b.PrintDot(fp);
    fclose(fp);

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

    small_example();

    sylvan_quit();
    lace_stop();

    return 0;
}
