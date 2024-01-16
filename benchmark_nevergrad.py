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
    SQP,
    NGOpt39,
    #GOMEA
)

DATA_ROOT = "/local/vermettendl/Maarten"
MODEL_ROOT = "./optimization"

model_ids = {
        "data_mixed_confounding1_EV30" : 61, 
        "data_mixed_confounding2_EV30": 62, 
        "data_mixed_confounding3_EV30": 63, 
        "data_mixed_confounding4_EV30": 64, 
        "data_toy_aglietti_EV100": 65,
        "data_causalpaper_EV30": 66,
        "data_causalpaper_EB30": 67,
}

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
            target_var, *_ = data["target_var"]
            search_vars = data["search_vars"]
            target_type = data['target']
            for source, target in data["edges"]:
                nodes[target].parents.append(nodes[source])
            

        with open(f"{model_name}_value_dict.json") as f:
            data = json.load(f)
            for key, value in data.items():
                nodes[key].bins = list(
                    map(lambda x: x[1], sorted(value.items(), key=lambda x: int(x[0])))
                )
                nodes[key].n_bins = len(nodes[key].bins)
        return nodes, target_var, search_vars, target_type

    def int_to_binary(self, value: int) -> Set[Tuple[int, bool]]:
        binary = np.binary_repr(value, self.n_idx)
        return set(zip(self.node_ids, map(int, binary)))


class Objective:
    def __init__(self, nodes: List[Node], diagram: dd.BnBdd, condition_node: Node, search_nodes: List[str], target_type: str):
        self.nodes = [node for node in nodes if node.name in search_nodes]
        self.diagram = diagram
        self.dimension = len(self.nodes)
        self.lb = np.zeros(len(self.nodes), dtype=int) - 1
        self.ub = np.array([node.n_bins - 1 for node in self.nodes], dtype=int)
        self.condition_node = condition_node
        self.max_y = max(self.condition_node.bins)
        self.min_y = min(self.condition_node.bins)
        self.condition_node_ops = [
            (self.condition_node.int_to_binary(bin_id), bin_value)
            for bin_id, bin_value in enumerate(self.condition_node.bins)
        ]
        self.minimize = (target_type == 'min')

    def filter_do_ops(self, do_ops, ids):
        """Filter a set of do-ops such that only the ops in ids remain"""
        return set([x for x in do_ops if x[0] in ids])

    def get_do_nodes(self, x):
        """Get the list of do nodes, filter only those that are not -1"""
        return [
            (node, node.int_to_binary(xi))
            for node, xi in zip(self.nodes, x)
            if xi >= 0
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
            pr_marginal = dd.bnbdd_marginalize(self.diagram, condition.union(do_ops))
            pr_total = 0
            if pr_marginal == 0:
                continue

            pr_do = 1.0
            for do_node, do_node_ops, do_ops_with_parent in do_nodes:
                pdo = dd.bnbdd_condition(self.diagram, do_node_ops, do_ops_with_parent)
                pr_do *= pdo
            pr_total = pr_marginal / pr_do
            sum_prob += pr_total
            expectation += pr_total * bin_value
        # print(sum_prob, expectation)
        # assert sum_prob == 0 or np.isclose(sum_prob, 1.0)
        if sum_prob > 1.01 or sum_prob < 0.99:
            print(f"Failure: probabilities sum to {sum_prob}")
            if self.minimize:
                expectation = self.max_y
            else:
                expectation = self.min_y
        return expectation

    def __call__(self, x: List[int]):
        print(x)
        expectation = self.calc_expected_value(x)
        if self.minimize:
            return (expectation - self.min_y) / np.abs(self.max_y - self.min_y)
        else:
            return (self.max_y - expectation) / np.abs(self.max_y - self.max_y)

def set_objective(dim: int, iid: int):
    return [float("nan")] * dim, 0.0

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
    p = Pool(min(21, len(arguments)))
    results = p.map(runFunction, arguments)
    p.close()
    return results

class Algorithm_Evaluator():
    def __init__(self, optimizer, ubs, budget=5000):
        self.alg = optimizer
        self.budget = budget
        self.param = ng.p.Instrumentation(*[ng.p.TransitionChoice(np.append(range(-1,ub), -2)) for ub in ubs])
        
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
    model_name = model_path
    model_id = model_ids[model_name]
    model_path = f"{MODEL_ROOT}/{model_path}"
    nodes, target_var, search_vars, target_type = Node.read(model_path)
    np.random.seed(1)
    with dd.SylvanRunnable():
        print("loading model...", end=" ")
        start = perf_counter()
        bnbdd = dd.bnbdd_from_files(model_path, False, False)
        print("time elapsed: ", perf_counter() - start, "s")

        obj = Objective(list(nodes.values()), bnbdd, nodes[target_var], search_vars, target_type)
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
            calculate_objective = set_objective
        )
        # problem.bounds.ub = obj.ub
        # problem.enforce_bounds(float("inf"), how=ioh.ConstraintEnforcement.HARD)
        print(obj.ub)
        logger = ioh.logger.Analyzer(root=DATA_ROOT, folder_name=f"{model_name}_{alg}", 
                                     triggers=[ioh.logger.trigger.ALWAYS], store_positions=True, 
                                     algorithm_name=alg)
        problem.set_id(model_id)
        problem.attach_logger(logger)
        alg = Algorithm_Evaluator(alg, obj.ub, budget)
        alg(problem, n_reps)

if __name__ == '__main__':
    warnings.filterwarnings("ignore", category=RuntimeWarning) 
    warnings.filterwarnings("ignore", category=FutureWarning)

    algnames = [    
        #"RCobyla",
        #"DiagonalCMA",
        "RandomSearch", 
        "DE", 
        "OnePlusOne", 
        "Powell", 
        "MultiBFGS",
        #"GOMEA", 
        #"DiscreteLenglerOnePlusOne", 
        #"OptimisticDiscreteOnePlusOne", 
        #"SQP",
        "NGOpt39",
        #"NgIoh"
    ]
    
    models = [
            "data_mixed_confounding1_EV30", 
            "data_mixed_confounding2_EV30", 
            "data_mixed_confounding3_EV30", 
            #"data_mixed_confounding4_EV30", 
            "data_toy_aglietti_EV100",
            "data_causalpaper_EV30",
            #"data_causalpaper_EB30",
    ]
    
    args = product(algnames, models)
    run_optimizer = partial(run_optimization, budget = 2000, n_reps=10)
    runParallelFunction(run_optimizer, args)
    #print("starting...")
    #run_optimizer(["RandomSearch", "data_toy_aglietti_EV100"])
