#include <map>
#include <set>

#include <sylvan.h>
#include <sylvan_obj.hpp>
#include <sylvan_int.h>

/***************************<Some type definitions>****************************/

typedef std::map<int,double> ProbMap;
typedef std::set<std::pair<int,bool>> Constraint;

typedef std::set<int> Clause;
typedef std::set<Clause> Cnf;
typedef std::map<int, int> VarConstraint; // var -> var_meta

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
    marg_1
};

/**************************</Some type definitions>****************************/





/**********************<Weighted model counting>*******************************/

static const uint64_t CACHE_WPBDD_MODELCOUNT = (200LL<<40);

TASK_DECL_3(double, wpbdd_modelcount, sylvan::BDD, int *, ProbMap *);
#define wpbdd_modelcount(dd, meta, pm) RUN(wpbdd_modelcount, dd, meta, pm)

/**
 * Compute Pr ( x1, x2, ... )
 */
double wpbdd_marginalize(WpBdd wpbdd, Constraint x);

/**
 * Compute Pr( x1, x2, ... | y1, y2, ... )
 */
double wpbdd_condition(WpBdd wpbdd, Constraint x, Constraint y);

/**
 * Compute Pr ( x1, x2, ..., | do(t) ), where pt are the parents of t
 * (For now, assume t only contains a single variable )
 */
double wpbdd_do(WpBdd wpbdd, Constraint x, Constraint t, std::set<int> pt);

/*********************</Weighted model counting>*******************************/





/***************<Loading CNF from file + building WPBDD>***********************/

/**
 * Agrument 'filepath' without '.cnf' extension. Assumes two files:
 * - filepath.cnf
 * - filepath.cnf_probs
 * - filepath.cnf_rv_vars
 */
WpBdd wpbdd_from_files(std::string filepath);

Cnf cnf_from_file(std::string filepath);

void print_cnf(Cnf cnf);

sylvan::Bdd cnf_to_bdd(Cnf f);

ProbMap probs_from_file(std::string filepath);

std::vector<int> rv_vars_from_file(std::string filepath);

void print_probmap(ProbMap pm);

void print_rv_vars(std::vector<int> rv_vars);

/**************</Loading CNF from file + building WPBDD>***********************/
