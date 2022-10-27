#include <map>

#include <sylvan.h>
#include <sylvan_obj.hpp>
#include <sylvan_int.h>

/***************************<Some type definitions>****************************/

typedef std::map<int,double> ProbMap;

// container for WPBDD info (dd + prob info + rv info)
struct WpBdd {
    sylvan::Bdd dd;
    ProbMap pm;
    std::vector<int> rv_vars;
    int nvars; // number of dd vars
};

enum var_meta {
    no_rv_var,     // vars not in domain or a prob_var
    marg_out,
    marg_0,
    marg_1,
    cond_0, // think we don't need cond_x, since we can compute conditionals
    cond_1  // form multiple marginals, i.e. Pr(a|b) = Pr(a^b) / Pr(b)
};

/**************************</Some type definitions>****************************/





/**********************<Weighted model counting>*******************************/

static const uint64_t CACHE_WPBDD_MODELCOUNT = (200LL<<40);

TASK_DECL_3(double, wpbdd_modelcount, sylvan::BDD, int *, ProbMap *);
#define wpbdd_modelcount(dd, meta, pm) RUN(wpbdd_modelcount, dd, meta, pm)

// WIP: utility functions which construct a meta (from simple arguments) and
// call wpbdd_modelcount

double wpbdd_marginalize(WpBdd wpbdd, std::vector<std::pair<int, bool>> constraints);

/*********************</Weighted model counting>*******************************/

