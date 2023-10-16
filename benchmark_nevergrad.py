import ioh
from itertools import product
from functools import partial
from multiprocessing import Pool, cpu_count

import sys
import argparse
import warnings
import os

import pandas as pd

import json
from itertools import chain
from time import perf_counter
from dataclasses import dataclass, field
from typing import List, Set, Tuple
from functools import cached_property
import ioh
import numpy as np


import dd_inference as dd

import time

import nevergrad as ng
import nevergrad.common.typing as tp

from nevergrad.optimization.optimizerlib import (
    RCobyla,
    DiagonalCMA,
    RandomSearch, 
    PSO, 
    OnePlusOne, 
    Powell, 
    MultiBFGS,
    DE, 
    DiscreteLenglerOnePlusOne, 
    OptimisticDiscreteOnePlusOne, 
    RSLSQP,
    NGOpt39,
    #NgIoh
)

DATA_ROOT = "./"
MODEL_ROOT = "./optimization"

@dataclass
class Node:
    name: str
    n_idx: int
    node_ids: List[int] = field(default_factory=list, repr=None)
    parents: List["Node"] = field(default_factory=list, repr=None)
    bins: List[float] = field(default_factory=list, repr=None)
    n_bins: int = None

    @cached_property
    def parent_ids(self):
        return set(chain.from_iterable([node.node_ids for node in self.parents]))

    @staticmethod
    def read(model_name):
        nodes = dict()
        with open(f"{model_name}.cnf_rv_vars") as f:
            for line in f:
                name, *bins = line.strip().split()
                nodes[name] = Node(name, len(bins), list(map(int, bins)))

        with open(f"{model_name}settings.json") as f:
            data = json.load(f)
            for source, target in data["edges"]:
                nodes[target].parents.append(nodes[source])

        with open(f"{model_name}_value_dict.json") as f:
            data = json.load(f)
            for key, value in data.items():
                nodes[key].bins = list(
                    map(lambda x: x[1], sorted(value.items(), key=lambda x: int(x[0])))
                )
                nodes[key].n_bins = len(nodes[key].bins)
        return nodes

    def int_to_binary(self, value: int) -> Set[Tuple[int, bool]]:
        binary = np.binary_repr(value, self.n_idx)
        return set(zip(self.node_ids, map(int, binary)))
   

class Objective:
    def __init__(self, nodes: List[Node], diagram: dd.WpBdd, condition_node: Node):
        self.nodes = [node for node in nodes if node != condition_node]
        self.diagram = diagram
        self.dimension = len(self.nodes)
        self.lb = np.zeros(len(self.nodes)) - 1
        self.ub = np.array([node.n_bins for node in self.nodes])
        self.condition_node = condition_node
        self.max_y = max(self.condition_node.bins)
        self.condition_node_ops = [
            (self.condition_node.int_to_binary(bin_id), bin_value)
            for bin_id, bin_value in enumerate(self.condition_node.bins)
        ]

    def filter_do_ops(self, do_ops, ids):
        """Filter a set of do-ops such that only the ops in ids remain"""
        return set([x for x in do_ops if x[0] in ids])

    def get_do_nodes(self, x):
        """Get the list of do nodes, filter only those that are not -1"""
        return [
            (node, node.int_to_binary(xi))
            for node, xi in zip(self.nodes, x)
            if xi != -1
        ]
    
    def get_do_ops(self, do_nodes):
        """Combine all the do ops for all do_nodes in a single set"""
        return set(chain.from_iterable(do_op for _, do_op in do_nodes))
    
    def remap_do_nodes(self, do_ops, do_nodes):
        """Add the set of do_ops for the parents nodes for a given do_node (caching)"""
        return [
            (do_node, do_node_ops, self.filter_do_ops(do_ops, do_node.parent_ids))
            for do_node, do_node_ops in do_nodes
        ]

    def calc_expected_value(self, x: List[int]):
        do_nodes = self.get_do_nodes(x)
        do_ops = self.get_do_ops(do_nodes)
        do_nodes = self.remap_do_nodes(do_ops, do_nodes)

        expectation = 0
        sum_prob = 0

        for condition, bin_value in self.condition_node_ops:
            pr_marginal = dd.wpbdd_marginalize(self.diagram, condition.union(do_ops))
            pr_total = 0
            if pr_marginal == 0:
                continue

            pr_do = 1.0
            for do_node, do_node_ops, do_ops_with_parent in do_nodes:
                pdo = dd.wpbdd_condition(self.diagram, do_node_ops, do_ops_with_parent)
                pr_do *= pdo
            pr_total = pr_marginal / pr_do
            sum_prob += pr_total
            expectation += pr_total * bin_value
        assert sum_prob == 0 or np.isclose(sum_prob, 1.0)
        return expectation

    def __call__(self, x: List[int]):
        expectation = self.calc_expected_value(x)
        return self.max_y - expectation

def runParallelFunction(runFunction, arguments):
    """
        Return the output of runFunction for each set of arguments,
        making use of as much parallelization as possible on this system

        :param runFunction: The function that can be executed in parallel
        :param arguments:   List of tuples, where each tuple are the arguments
                            to pass to the function
        :return:
    """
    

    arguments = list(arguments)
    p = Pool(min(2, len(arguments)))
    results = p.map(runFunction, arguments)
    p.close()
    return results

class Algorithm_Evaluator():
    def __init__(self, optimizer, ubs, budget=5000):
        self.alg = optimizer
        self.budget = budget
        self.param = ng.p.Instrumentation(*[ng.p.TransitionChoice(range(-1,ub)) for ub in ubs])
        
        # self.param_dict = {}
        # for k,v in in_params:
        #     p1 = {k : ng.p.TransitionChoice(range(-1,v))}
        #     self.param_dict.update(p1)        
        
    def __call__(self, func, n_reps):

        for seed in range(n_reps):
            np.random.seed(int(seed))
            
            def func_interface(*args):
                if func.state.optimum_found:
                    return 0
                return func(list(args))
            
            parametrization = self.param
            optimizer = eval(f"{self.alg}")(
                parametrization=parametrization, budget=int(self.budget)
            )
            optimizer.minimize(func_interface)
            print(func.state)
            func.reset()
        
def run_optimization(args, budget=5000, n_reps = 10):
    alg, model_path = args
    model_path = f"{MODEL_ROOT}/{model_path}"
    nodes = Node.read(model_path)
    np.random.seed(1)
    with dd.SylvanRunnable():
        print("loading model...", end=" ")
        start = perf_counter()
        wpbdd = dd.wpbdd_from_files(model_path, False, False)
        print("time elapsed: ", perf_counter() - start, "s")

        obj = Objective(list(nodes.values()), wpbdd, nodes["E"])
        def calc_obj(x,y):
            return [x*[0], 0]
        problem = ioh.wrap_problem(
            obj,
            f"{os.path.basename(model_path)}_objective",
            ioh.ProblemClass.INTEGER,
            obj.dimension,
            0,
            ioh.OptimizationType.MIN,
            min(obj.lb),
            max(obj.ub),
            calculate_objective = calc_obj
        )
        logger = ioh.logger.Analyzer(root=DATA_ROOT, folder_name=f"{model_path}_")
        alg = Algorithm_Evaluator(alg, obj.ub, budget)
        alg(problem, n_reps)

if __name__ == '__main__':
    warnings.filterwarnings("ignore", category=RuntimeWarning) 
    warnings.filterwarnings("ignore", category=FutureWarning)

    algnames = [    
        # "RCobyla",
        # "DiagonalCMA",
        "RandomSearch", 
        # "PSO", 
        # "OnePlusOne", 
        # "Powell", 
        # "MultiBFGS",
        # "DE", 
        # "DiscreteLenglerOnePlusOne", 
        # "OptimisticDiscreteOnePlusOne", 
        # "RSLSQP",
        # "NGOpt39",
        #"NgIoh"
    ]
    
    models = [
        "data_lg_EV30"
    ]
    
    args = product(algnames, models)
    run_optimizer = partial(run_optimization, budget = 500, n_reps=10)
    runParallelFunction(run_optimizer, args)