"""
Setup instuctions:
    $ ./compile_sources.sh    
    $ pip install pybind11 
    $ python setup.py develop
    $ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/dd_inference/sylvan_build/src 
    $ python run.py

TODO: Objective function
"""
import dd_inf as dd

TEST_MODEL_PATH  = "./models/toy_networks/line"

if __name__ == "__main__":
    tracepeak = True
    verbose = True

    with dd.SylvanRunnable():
        wpbdd = dd.wpbdd_from_files(TEST_MODEL_PATH, tracepeak, verbose)
        print()
        print("pm", wpbdd.pm)
        print("rv_vars", wpbdd.rv_vars)
        print("nvars", wpbdd.nvars)
        print("peaknodes", wpbdd.peaknodes)
        print("nvars", wpbdd.nvars)
        
        A, B, C = wpbdd.rv_vars
        pr_mar = dd.wpbdd_marginalize(wpbdd, set())
        pr_con = dd.wpbdd_condition(wpbdd, {(A, 0)}, {(B, 0)})
        pr_do = dd.wpbdd_do(wpbdd, {(A, 0)}, {(B, 0)}, {A})
        print()
        print("pr marginalize", pr_mar)
        print("pr con", pr_con)
        print("pr do", pr_do)
        print()