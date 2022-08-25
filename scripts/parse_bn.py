import os
import sys
from typing import Iterable
from itertools import product

import numpy as np
import pylab as plt
import networkx as nx
from pysat.formula import CNF # python-sat package
from pgmpy.models import BayesianNetwork
from pgmpy.factors.discrete import TabularCPD
from pgmpy.readwrite import XMLBIFReader, XMLBIFWriter


verbose = True


def info(*args, **kwargs):
    if (verbose):
        print(*args, **kwargs)


class RandomVariable:
    """
    Class to keep some info about a random variable. 
    """

    def __init__(self, name : str, cardinality : int):
        self.name = name
        self.cardinality = cardinality
        self.values = list(range(cardinality))
        self.nbits = int(np.ceil(np.log2(cardinality)))
    
    def __str__(self) -> str:
        return (self.name, self.cardinality, self.values, self.bits).__str__()

    def assign_boolean_vars(self, start : int) -> int:
        """
        Assigns Boolean variables [start, ..., start + nbits - 1] to encode an
        assignment to this random variable.

        Returns:
            The next unused variable number (start + nbits)
        """
        end = start + self.nbits
        self.boolean_vars = list(range(start, end))
        return end


class BayesianNetworkEncoder:
    """
    Class to keep the encoding functions in. This way we can keep some of the
    data in fields instead of global variables. (Also we have a fetish for OOP).
    and we have a fetisch for object oriented programming.
    """

    def __init__(self, bn : BayesianNetwork):
        self.bn = bn
        self.rvs = {}        # name -> RV
        self.prob_vars = {}  # probs -> int (Boolean var)
        self.cnf = CNF()     # CNF formula


    def visualize_bn(self):
        """
        Write a simple visualization of the BN to a file.
        """
        graph = nx.DiGraph(self.bn.edges())
        pos = nx.nx_agraph.graphviz_layout(graph)
        nx.draw(graph, pos=pos, with_labels=True)
        plt.savefig('bn.png')


    def _add_clause(self, variables: Iterable, assignment : Iterable, prob : float):
        """
        Adds a Boolean expression which encodes Pr(variables = assignment) = prob.

        Args:
            variables: Iterable of RV names (str)
            assignment: Iterable of assignments to these RVs (ints)
            prob: the corresponding probability
        """

        # Turn the assignment into a cube of literals
        literals = []
        for i in range(len(variables)):
            # turn the assignment (an integer) into a bitstring of lenght nbits
            rv = self.rvs[variables[i]]
            assignment_bits = format(assignment[i], f'0{rv.nbits}b')

            # turn the assignment bits into Boolean literals
            for j in range(rv.nbits):
                if assignment_bits[j] == '0':
                    literals.append(-rv.boolean_vars[j])
                elif assignment_bits[j] == '1':
                    literals.append(rv.boolean_vars[j])
                else:
                    raise ValueError(f'unexpected value {assignment_bits[j]} in bitstring')

        # TODO: Add this cube + implication to some list or file
        # TODO: Use CNF instead of cubes + implications? Does it matter?
        info(f"Pr({','.join(variables)} = {assignment}) = {prob}", end='')
        info(f"\tencoded as {literals} ==> {self.prob_vars[prob]} ({prob})")

        # Turn cube + implication into CNF clause:
        # (x1 ^ x2 ^ x3 ^ ... ==> w1) = (~x1 v ~x2 v ~x3 v ... v ~w1)
        print(literals)
        clause = [-lit for lit in literals]
        clause.append(self.prob_vars[prob])
        print(clause)
        self.cnf.append(clause)


    def _cpd_to_cnf(self, cpd):
        """
        Convert a single CPD table to a Boolean formula (maybe CNF).
        """
        # 1. Get the actual table
        evidence = cpd.get_evidence()
        table    = cpd.values # this is an n-d array (get_values() is not)

        # 2. Collect all vars (table var + evidence vars) and values they can take
        all_vars = [ cpd.variable ]
        all_vals = [ self.rvs[cpd.variable].values ]
        for e in reversed(evidence):
            all_vals.append(self.rvs[e].values)
            all_vars.append(e)

        # 3. Iterate over all table entries (i.e. all assignments to the RVs)
        info(f"Pr({cpd.variable} | {','.join(evidence)})")
        for assignment in product(*all_vals):
            self._add_clause(all_vars, assignment, table[assignment])
        info()


    def bn_to_cnf(self, bn : BayesianNetwork) -> CNF:
        """
        Convert the given BN to a Boolean formula (maybe CNF).
        """

        # 1. get all variables + cardinalities + unique probs
        probs = set()
        nodes = bn.nodes()
        for node in nodes:
            cpd = bn.get_cpds(node) # get the CPD of this node
            cards = cpd.cardinality
            self.rvs[node] = RandomVariable(name=node, cardinality=cards[0])
            for value in np.nditer(cpd.get_values()):
                probs.add(float(value))
            info("Node:", node)
            info(cpd, '\n')

        # 2. Assign Boolean vars to the RVs + assign vars to probs
        x = 1
        for rv in self.rvs.values():
            x = rv.assign_boolean_vars(x)
        for p in probs:
            self.prob_vars[p] = x
            x += 1

        # 3. encode CPDs into implications: a ^ b ^ ... ==> w
        for node in nodes:
            cpd = bn.get_cpds(node)
            self._cpd_to_cnf(cpd)

        return self.cnf


def parse_args():
    if len(sys.argv) < 2:
        print("Please specify a filepath to a .xmlbif BN file.")
        exit()
    model_path = sys.argv[1]
    return model_path


if __name__ == '__main__':

    model_path = parse_args()

    # read BN
    reader = XMLBIFReader(model_path)
    model = reader.get_model()

    # encode as cnf
    bn_encoder = BayesianNetworkEncoder(model)
    bn_encoder.visualize_bn()
    cnf = bn_encoder.bn_to_cnf(model)

    # write to file
    output_file = os.path.splitext(model_path)[0]+'.cnf'
    cnf.to_file(output_file)

    #model = toy_network_1()
    #model = toy_network_2()
    #writer = XMLBIFWriter(model)
    #writer.write_xmlbif("models/line.xmlbif")
