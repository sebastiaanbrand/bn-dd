#include <iostream>
#include <iterator>
#include <set>
#include <sylvan_obj.hpp>

int main() {
    std::cout << "Hello there!" << std::endl;


    // CNF -> BDD ?
    std::set<int> clause = {1,2,-3};
    std::set<int>::iterator itr;
    for (itr = clause.begin(); itr != clause.end(); itr++) {
        std::cout << *itr << " ";
    }
    std::cout << std::endl;

    return 0;
}
