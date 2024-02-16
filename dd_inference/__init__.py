from time import perf_counter
from .ddcpp import (
    bnbdd_marginalize,
    bnbdd_condition,
    bnbdd_do_naive,
    bnbdd_from_files,
    cnf_from_file,
    print_cnf,
    probs_from_file,
    rv_vars_from_file,
    print_probmap,
    print_rv_vars,
    init_system,
    shutdown_system, 
    bnbdd_do_cov_adj,
    BnBdd
)

class SylvanRunnable:
    def __init__(self, n_workers: int = 1, dqsize: int = 0):
        print("starting sylvan...", end = " ")
        start = perf_counter()
        init_system(n_workers, dqsize)
        print(f"time elapsed: {perf_counter() - start: .3f}s" )

    def __enter__(self):
        return self
    
    def __exit__(self, ttype, value, traceback):
        print("stopping sylvan...", end = " ")
        start = perf_counter()
        shutdown_system()
        print(f"time elapsed: {perf_counter() - start: .3f}s" )