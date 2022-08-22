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
        self.bits = int(np.ceil(np.log2(cardinality)))
    
    def __eq__(self, __o: object) -> bool:
        if type(__o) is RandomVariable:
            return self.name == __o.name
        else:
            return False

    def __str__(self) -> str:
        return (self.name, self.cardinality, self.values, self.bits).__str__()


def visualize(bn : BayesianNetwork):
    graph = nx.DiGraph(bn.edges())
    pos = nx.nx_agraph.graphviz_layout(graph)
    nx.draw(graph, pos=pos, with_labels=True)
    plt.savefig('bn.png')


def to_binary_enc(cards: Iterable, vals : Iterable, weight : float):
    pass


def cpd_to_cnf(cpd : TabularCPD, rvs : dict):
    evidence = cpd.get_evidence()
    table    = cpd.get_values()
    cards    = tuple(cpd.cardinality)
    info("Variable:", cpd.variable)
    info("Evidence:", evidence)
    info("Cards:", cards)
    info("Table:\n", table)
    
    # the 'flat' CPD table is unworkable in code
    table2 = np.reshape(table, cards, order='F')
    info("Reshaped table\n", table2)
    info()

    all_vals = []
    all_vals.append(rvs[cpd.variable].values)
    for e in evidence:
        all_vals.append(rvs[e].values)

    info(f"Pr({cpd.variable} | {evidence})")
    for combination in product(*all_vals):
        # NOTE: we have access to assignment --> prob here,
        # TODO: check if reshaping works correctly (looks correct for dim <= 3)
        info(*combination, "-->", table2[combination])
    info("\n")


def bn_to_cnf(bn : BayesianNetwork):

    rvs = {}      # name -> RV
    weights = {}  # prob -> CNF var

    # 1. get all variables + cardinalities
    nodes = bn.nodes()
    for node in nodes:
        cpd = bn.get_cpds(node) # get the CPD of this node
        cards = cpd.cardinality
        rvs[node] = RandomVariable(name=node, cardinality=cards[0])
        
        #info("Node:", node)
        #info("Card:", cpd.cardinality) # [card(var), card(ev1), card(ev2)]
        #info(cpd, '\n')

    # 2. encode CPDs into implications:
    #    tuple([a,b,..], w) <==> a ^ b ^ ... ==> w
    for node in nodes:
        cpd = bn.get_cpds(node)
        cpd_to_cnf(cpd, rvs)


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

    


