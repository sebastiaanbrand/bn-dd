from ast import Raise
from typing import Iterable
from itertools import product

import numpy as np
import pylab as plt
import networkx as nx
from pgmpy.models import BayesianNetwork
from pgmpy.factors.discrete import TabularCPD
from pgmpy.readwrite import XMLBIFReader, XMLBIFWriter


verbose = True


def info(*values):
    if (verbose):
        print(*values)


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


def visualize(bn : BayesianNetwork):
    """ Write a simple visualization of the BN to a file. """
    graph = nx.DiGraph(bn.edges())
    pos = nx.nx_agraph.graphviz_layout(graph)
    nx.draw(graph, pos=pos, with_labels=True)
    plt.savefig('bn.png')


def add_clause(variables: Iterable, assignment : Iterable, prob : float, 
               rvs : dict,  prob_vars : dict):
    """
    Adds a Boolean expression which encodes Pr(variables = assignment) = prob.

    Args:
        variables: Iterable of RV names (str)
        assignment: Iterable of assignments to these RVs (ints)
        prob: the corresponding probability
        rvs: map from  RV name (str) -> RV (RandomVariable)
        prob_vars: map from prob (float) -> Boolean var (int)
    """

    # Turn the assignment into a cube of literals
    literals = []
    for i in range(len(variables)):
        # turn the assignment (an integer) into a bitstring of lenght nbits
        rv = rvs[variables[i]]
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
    info(f'Pr({variables} = {assignment}) = {prob}')
    info(f'{literals} ==> {prob_vars[prob]} ({prob})')


def cpd_to_cnf(cpd : TabularCPD, rvs : dict, prob_vars : dict):
    """
    Convert a single CPD table to a Boolean formula (maybe CNF).
    """
    # 1. Get the actual table (and reshape to n-D table)
    evidence = cpd.get_evidence()
    table    = cpd.get_values()
    cards    = tuple(cpd.cardinality)
    table    = np.reshape(table, cards, order='F') # the 2D CPT is unworkable

    # 2. Collect all vars (table var + evidence vars) and values they can take
    all_vars = [ cpd.variable ]
    all_vals = [ rvs[cpd.variable].values ]
    for e in evidence:
        all_vals.append(rvs[e].values)
        all_vars.append(e)

    # 3. Iterate over all table entries (i.e. all assignments to the RVs)
    info(f"Pr({cpd.variable} | {evidence})")
    for assignment in product(*all_vals):
        add_clause(all_vars, assignment, table[assignment], rvs, prob_vars)
    info()


def bn_to_cnf(bn : BayesianNetwork):
    """
    Convert the given BN to a Boolean formula (maybe CNF).
    """
    rvs = {}        # name -> RV
    probs = set()   # unique probs
    prob_vars = {}  # probs -> int (Boolean var)

    # 1. get all variables + cardinalities + unique probs
    nodes = bn.nodes()
    for node in nodes:
        cpd = bn.get_cpds(node) # get the CPD of this node
        cards = cpd.cardinality
        rvs[node] = RandomVariable(name=node, cardinality=cards[0])
        for value in np.nditer(cpd.get_values()):
            probs.add(float(value))
        info("Node:", node)
        info(cpd, '\n')

    # 2. Assign Boolean vars to the RVs + assign vars to probs
    x = 1
    for rv in rvs.values():
        x = rv.assign_boolean_vars(x)
    for p in probs:
        prob_vars[p] = x
        x += 1

    # 3. encode CPDs into implications: a ^ b ^ ... ==> w
    for node in nodes:
        cpd = bn.get_cpds(node)
        cpd_to_cnf(cpd, rvs, prob_vars)


if __name__ == '__main__':

    # read BN and turn into CNF
    reader = XMLBIFReader("models/student.xmlbif")
    model = reader.get_model()
    visualize(model)
    bn_to_cnf(model)

    #model = toy_network_1()
    #model = toy_network_2()
    #writer = XMLBIFWriter(model)
    #writer.write_xmlbif("models/line.xmlbif")
