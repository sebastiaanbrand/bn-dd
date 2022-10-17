#include <iostream>

#include <wpbdd_inference.hpp>


/**********************<Weighted model counting>*******************************/

TASK_IMPL_3(double, wpbdd_modelcount, sylvan::BDD, dd, int *, meta, ProbMap *, pm)
{
    // TODO: deal with skipped vars
    // TODO: add restriction (i.e. compute marginal/conditional probabilities)
    if (dd == sylvan::sylvan_true) return 1.0;
    if (dd == sylvan::sylvan_false) return 0.0;


    /* Consult cache */
    // TODO: encode meta in e.g. LDD and add to cache key?
    union { double d; uint64_t s; } hack;
    if (sylvan::cache_get3(CACHE_WPBDD_MODELCOUNT, dd, 0, 0, &hack.s)) {
        return hack.d;
    }

    sylvan::mtbddnode_t node = sylvan::MTBDD_GETNODE(dd);
    uint32_t var     = sylvan::mtbddnode_getvariable(node);
    sylvan::BDD low  = sylvan::mtbddnode_getlow(node);
    sylvan::BDD high = sylvan::mtbddnode_gethigh(node);
    double prob_low  = 0;
    double prob_high = 0;

    switch (meta[var])
    {
    case no_rv_var:
        // current var should correspond to a weight / prob
        prob_low  = CALL(wpbdd_modelcount, low, meta, pm); // only used for assert
        prob_high = CALL(wpbdd_modelcount, high, meta, pm);
        assert(pm->count(var));
        assert(prob_low == 0);
        hack.d = (*pm)[var] * prob_high;
        break;
    case marg_out:
        // current var should be marginalized out
        prob_low  = CALL(wpbdd_modelcount, low, meta, pm);
        prob_high = CALL(wpbdd_modelcount, high, meta, pm);
        hack.d = prob_low + prob_high;
        break;
    case marg_0:
        // compute prob for var = 0
        prob_low  = CALL(wpbdd_modelcount, low, meta, pm);
        hack.d = prob_low;
        break;
    case marg_1:
        // compute prob for var = 1
        prob_high = CALL(wpbdd_modelcount, high, meta, pm);
        hack.d = prob_high;
        break;
    case cond_0:
        // TODO: We need Pr(var = 0) here. 
        // for now: let's just use wpbdd_modelcount() to compute this prob,
        // and assume the operation cache to catch any redundant computations
        std::cerr << "cond_0 (" << cond_0 << ") not yet handled" << std::endl;
        break;
    case cond_1:
        // TODO
        std::cerr << "cond_1 (" << cond_1 << ") not yet handled" << std::endl;
        break;
    default:
        std::cerr << "Unknown meta value '" << meta[var] << "'" << std::endl;
        exit(1);
        break;
    }

    /* Put in cache */
    sylvan::cache_put3(CACHE_WPBDD_MODELCOUNT, dd, 0, 0, hack.s);

    return hack.d;
}

double
wpbdd_marinalize(WpBdd wpbdd, int var, bool val)
{
    // Construct meta which encodes computing Pr(var = val) by modelcounting
    int meta[wpbdd.nvars] = {0};
    for (int i : wpbdd.rv_vars) {
        meta[i] = marg_out; // marginalize all (rv) vars out
    }
    meta[var] = val ? marg_1 : marg_0;

    // Compute using model counting
    sylvan::cache_clear(); // new meta, need to reset cache
    return wpbdd_modelcount(wpbdd.dd.GetBDD(), meta, &(wpbdd.pm));
}

/*********************</Weighted model counting>*******************************/