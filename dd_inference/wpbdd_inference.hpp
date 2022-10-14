#include <map>

#include <sylvan.h>
#include <sylvan_obj.hpp>
#include <sylvan_int.h>

/***************************<Some type definitions>****************************/

typedef sylvan::BDD WPBDD;
typedef std::map<int,double> ProbMap;

enum var_meta {
    no_rv_var,     // vars not in domain or a prob_var
    marg_out,
    marg_0,
    marg_1,
    cond_0,
    cond_1
    // TODO: probably we can just add do_0 and do_1 here
};

/**************************</Some type definitions>****************************/





/**********************<Weighted model counting>*******************************/

static const uint64_t CACHE_WPBDD_MODELCOUNT = (200LL<<40);

TASK_DECL_3(double, wpbdd_modelcount, WPBDD, int *, ProbMap *);
#define wpbdd_modelcount(dd, meta, pm) RUN(wpbdd_modelcount, dd, meta, pm)

/*********************</Weighted model counting>*******************************/

