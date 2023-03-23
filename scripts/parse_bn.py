import os
import argparse
from typing import Iterable
from itertools import product

import numpy as np
import pylab as plt
import networkx as nx
from pysat.formula import CNF # python-sat package
from pgmpy.models import BayesianNetwork
from pgmpy.readwrite import XMLBIFReader


verbose = 3
merge_probs = True
custom_rv_order = True
interleave_probs = True

parser = argparse.ArgumentParser(description='Convert BN from .xmlbif to CNF')
parser.add_argument('filepath', type=str, help='path to .xmlbif BN file')
parser.add_argument('--folder', action='store_true', dest='parsefolder', default=False,
                    help='parse all .xmlbif files in folder (given in filepath)')
parser.add_argument('--no-prob-merge', action='store_false', dest='merge_probs', default=True,
                    help='do not merge IDs for equal probs in a CPT')
parser.add_argument('--draw-bn', action='store_true', dest='draw_bn', default=False,
                    help='write the BN as an image to bn.png')
parser.add_argument('--custom-rv-order', action='store_true', dest='custom_rv_order', default=False,
                    help='allow custom order for RVs (relevant for DD size)')
parser.add_argument('--no-interleave-probs', action='store_true', dest='no_interleave_probs', default=False,
                    help='put prob vars at bottom of DD (default interleaved with RV vars)')


def info(*args, level=3, **kwargs):
    if (verbose >= level):
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
            The last used variable number (start + nbits - 1)
        """
        end = start + self.nbits
        self.boolean_vars = list(range(start, end))
        return end - 1


class BayesianNetworkEncoder:
    """
    Class to keep the encoding functions in. This way we can keep some of the
    data in fields instead of global variables. (Also we have a fetish for OOP).
    and we have a fetisch for object oriented programming.
    """

    def __init__(self, bn : BayesianNetwork):
        self.bn = bn
        self.rvs = {}           # name -> RV
        self.prob_vars = {}     # int (Boolean var) -> prob (float)
        self.pr_zero_var = None # unique var corresponding to Pr(..) = 0
        self.cnf = CNF()        # CNF formula
        self._last_var = 0

    def visualize_bn(self):
        """
        Write a simple visualization of the BN to a file.
        """
        graph = nx.DiGraph(self.bn.edges())
        pos = nx.nx_agraph.graphviz_layout(graph)
        nx.draw(graph, pos=pos, with_labels=True)
        plt.savefig('bn.png')

    def _get_next_var(self) -> int:
        """
        Returns the next unused variable (_last_var contains the last used var).
        """
        self._last_var += 1
        return self._last_var


    def _add_clause(self, variables: Iterable, assignment : Iterable, prob : float, prob_map : map):
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

        # Get integer ID for this particular probability. If merge_probs == True
        # only a single unique ID is used for every equal prob per CPT.
        # Otherwise, a new ID is used for every prob, even duplicate probs.
        if prob == 0:
            # no omega variable for 0, instead just: (x ==> 0) == not(x)
            w = 'false'
        elif merge_probs:
            w = prob_map[prob]
            self.prob_vars[w] = prob
        else:
            w = self._get_next_var() # if no merging, get new unique var number
            self.prob_vars[w] = prob
        info(f"Pr({','.join(variables)} = {assignment}) = {prob}", end='')
        info(f"\tencoded as {literals} ==> {w} ({prob})")

        # Turn cube + implication into CNF clause:
        # (x1 ^ x2 ^ x3 ^ ... ==> w) = (~x1 v ~x2 v ~x3 v ... v w)
        clause = [-lit for lit in literals]
        if w != 'false':
            clause.append(w)
        info(clause)
        self.cnf.append(clause)


    def _cpd_to_cnf(self, cpd, prob_map):
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
            self._add_clause(all_vars, assignment, table[assignment], prob_map)

        # 4. For the "unused values" v, i.e. where maxval < v < 2^bits,
        #    add clauses (v ==> 0) == not(v)
        last_val = self.rvs[cpd.variable].values[-1]
        max_val  = 2**self.rvs[cpd.variable].nbits - 1
        for val in range(last_val + 1, max_val + 1):
            self._add_clause([cpd.variable], [val], 0, prob_map)
        info()


    def _get_topological_order(self):
        """
        Given the BN in self.bn, get a topological ordering order over the nodes
        of this network.
        """
        graph = nx.DiGraph(self.bn.edges())
        return list(nx.topological_sort(graph))


    def bn_to_cnf(self, bn : BayesianNetwork) -> CNF:
        """
        Convert the given BN to a Boolean formula (maybe CNF).
        """

        # 1. get all variables + cardinalities + unique probs per CPT
        unique_probs = {} # node (name) --> prob map ( prob --> var )
        nodes = bn.nodes()
        for node in nodes:
            cpd = bn.get_cpds(node) # get the CPD of this node
            cards = cpd.cardinality
            self.rvs[node] = RandomVariable(name=node, cardinality=cards[0])
            probs = set()
            for value in np.nditer(cpd.get_values()):
                probs.add(float(value))
            unique_probs[node] = probs
            info("Node:", node)
            info(cpd)
            info("Unique probs = ", probs, '\n')
        

        # 2. Option to reorder the variables
        rv_order = self._get_topological_order()
        if (custom_rv_order):
            print(f"Current order = {rv_order}")
            rv_order = input("Specify a new order: ").split()
            print(f"New order = {rv_order}")

        # 3. Per CPT:
        prob_maps = [None] * len(nodes)
        for i, name in enumerate(rv_order):
            # 3a. Assign Boolean vars to the RVs 
            self._last_var = self.rvs[name].assign_boolean_vars(self._last_var + 1)

            # 3b. Assign unique var to each probability
            if (interleave_probs):
                if (merge_probs):
                    prob_map = {}
                    for p in unique_probs[name]:
                        prob_map[p] = self._get_next_var()
                    prob_maps[i] = prob_map
                else:
                    print("ERROR: --no-prob-merge also requires --no-interleave-probs")
                    exit()

        # 3b. Assign unique var to each probability *per CPT*
        if (not interleave_probs):
            if (merge_probs):
                #for i in range(len(nodes)):
                for i, name in enumerate(rv_order):
                    prob_map = {}
                    for p in unique_probs[name]:
                        prob_map[p] = self._get_next_var()
                    prob_maps[i] = prob_map
            else:
                pass
                # vars are assigned to probs in _cpd_to_cnf

        # 5. encode CPDs into implications: a ^ b ^ ... ==> w
        for i, node in enumerate(rv_order):
            cpd = bn.get_cpds(node)
            self._cpd_to_cnf(cpd, prob_maps[i])

        return self.cnf

    def write_probs(self, outputfile):
        with open(outputfile, 'w') as f:
            for (var, prob) in self.prob_vars.items():
                f.write(f"{var} {prob}\n")

    def write_rv_vars(self, outputfile):
        with open(outputfile, 'w') as f:
            for rv in self.rvs.values():
                f.write(f"{rv.name}")
                for bool_var in rv.boolean_vars:
                    f.write(f" {bool_var}")
                f.write("\n")
    
    def count_rv_vars(self):
        counter = 0
        for rv in self.rvs.values():
            counter += rv.nbits
        return counter


def get_xmlbif_files(folder):
    """ Get all filepaths to .xmlbif files in the given folder. """
    
    model_paths = []
    for filename in os.listdir(folder):
        if (filename[-7:] == '.xmlbif'):
            filepath = os.path.join(folder, filename)
            model_paths.append(filepath)
    return model_paths


if __name__ == '__main__':

    args = parser.parse_args()
    merge_probs = args.merge_probs
    path = args.filepath
    custom_rv_order = args.custom_rv_order
    interleave_probs = not args.no_interleave_probs

    if (args.parsefolder):
        verbose = 1
        model_paths = get_xmlbif_files(path)
    else:
        model_paths = [path]

    for model_path in model_paths:
        info(f"Processing BN {model_path}...", level=1)
        # read BN
        reader = XMLBIFReader(model_path)
        model = reader.get_model()

        # encode as cnf
        bn_encoder = BayesianNetworkEncoder(model)
        if (args.draw_bn):
            bn_encoder.visualize_bn()
        cnf = bn_encoder.bn_to_cnf(model)

        # write to file
        out_template = os.path.splitext(model_path)[0]
        cnf.to_file(out_template + '.cnf')
        bn_encoder.write_probs(out_template + '.cnf_probs')
        bn_encoder.write_rv_vars(out_template + '.cnf_rv_vars')

        # write some info
        info("CNF formula has:")
        info(f"  * {bn_encoder.count_rv_vars()} variables for BN random variables")
        info(f"  * {len(bn_encoder.prob_vars)} variables for probabilities")
        info(f"  * {len(bn_encoder.cnf.clauses)} clauses")
