"""
Setup instuctions:
    $ ./compile_sources.sh    
    $ pip install pybind11 
    $ python setup.py develop
    $ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/dd_inference/sylvan_build/src 
    $ python run.py

# Networks are like this
D 1
G 7 8 -> this means there are two boolean variables encoding G
I 4
L 24
S 19

TODO: Objective function
"""
import json
import os
import itertools
from time import perf_counter
from dataclasses import dataclass, field
from typing import List, Set, Tuple
import ioh
import numpy as np

import dd_inference as dd

TEST_MODEL_PATH = "./models/toy_networks/line"
MODEL_PATH = "./optimization/data_lg_EV30"


@dataclass
class Node:
    name: str
    n_idx: int
    node_ids: List[int] = field(default_factory=list, repr=None)
    parents: List["Node"] = field(default_factory=list)
    bins: List[float] = field(default_factory=list, repr=None)
    n_bins: int = None

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
        return set(zip(self.node_ids[::-1], map(int, binary)))


class Objective:
    def __init__(self, nodes: List[Node], diagram: dd.WpBdd, condition_node: Node):
        self.nodes = [node for node in nodes if node != condition_node]
        self.all_parent_nodes = set(
            itertools.chain.from_iterable([node.node_ids for node in self.nodes])
        )
        self.diagram = diagram
        self.dimension = len(self.nodes)
        self.lb = np.zeros(len(self.nodes)) - 1
        self.ub = np.array([node.n_bins for node in self.nodes])
        self.condition_node = condition_node
        self.min_y = min(self.condition_node.bins)

    def get_do_ops(self, x: List[int]):
        do_ops = set()
        for xi, node in zip(x, self.nodes):
            if xi == -1:
                continue
            do_ops.update(node.int_to_binary(xi))
        return do_ops

    def get_parent_nodes(self, do_nodes: List[Node]):
        # TODO: Who is a parent?
        # return self.parent_nodes.copy()
        parents = set()
        for node in do_nodes:
            for parent in node.parents:
                parents.update(parent.node_ids)
        return parents

    def calc_expected_value(self, x: List[int]):
        do_ops = self.get_do_ops(x)
        do_nodes = [node for node, xi in zip(self.nodes, x) if xi != -1]
        parent_nodes = self.get_parent_nodes(do_nodes)

        expectation = 0
        sum_prob = 0
        print("parent_nodes", parent_nodes)
        for bin_id, bin_value in enumerate(self.condition_node.bins):
            condition = self.condition_node.int_to_binary(bin_id)

            pr_condition = dd.wpbdd_do(self.diagram, condition, do_ops, parent_nodes)
            sum_prob += pr_condition
            print(pr_condition, bin_value)
            expectation += pr_condition * bin_value
        print("Sum probabilties", sum_prob)
        return expectation

    def __call__(self, x: List[int]):
        expectation = self.calc_expected_value(x)
        return expectation  # - self.min_y


if __name__ == "__main__":
    tracepeak = True
    verbose = False
    nodes = Node.read(MODEL_PATH)

    with dd.SylvanRunnable():
        print("loading model...", end=" ")
        start = perf_counter()
        wpbdd = dd.wpbdd_from_files(MODEL_PATH, tracepeak, verbose)
        print("time elapsed: ", perf_counter() - start, "s")

        obj = Objective(list(nodes.values()), wpbdd, nodes["E"])
        problem = ioh.wrap_problem(
            obj,
            f"{os.path.basename(MODEL_PATH)}_objective",
            ioh.ProblemClass.INTEGER,
            obj.dimension,
            0,
            ioh.OptimizationType.MIN,
            min(obj.lb),
            max(obj.ub),
        )

        print("Applying a single do operator")
        x0 = [1, -1, -1, -1]
        f0 = problem(x0)
        print(x0, f0)
        print()

        print("Applying two do operators")
        x0 = [1, -1, 1, -1]
        f0 = problem(x0)
        print(x0, f0)
        print()

        print("Applying three do operators")
        x0 = [1, -1, 1, 1]
        f0 = problem(x0)
        print(x0, f0)
        print()

        print("Applying four do operators")
        x0 = [1, 1, 1, 1]
        f0 = problem(x0)
        print(x0, f0)
        print()

        print("Random search multiple ops")
        for _ in range(10):
            x0 = np.random.randint(-1, 30, 4)
            f0 = problem(x0)
            print(x0, f0)
            print()

        print("Random search single op")
        for _ in range(10):
            x0 = np.zeros(4, dtype=int) - 1
            x0[np.random.randint(0, 4)] = np.random.randint(0, 30)
            f0 = problem(x0)
            print(x0, f0)
            print()