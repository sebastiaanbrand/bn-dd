import os
import argparse
from lgnpy import LinearGaussian
import numpy as np
import logging.config
import sys
import pandas as pd
import json

parser = argparse.ArgumentParser(description='Generate Bayesian Network')
parser.add_argument('distribution', type=str, help='Sort of distribution to consider')

class LG_generator:
    """Creating the linear gaussian Bayesian Network:
    TODO: Generalize making the input lg_edges, root_params and lin_params and computing
    """

    def __init__(self, N):

            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        logger = logging.getLogger()
        self.logger = logging.getLogger(__name__)

        self.N = N
        self.lg = LinearGaussian()
        self.lg_edges = [('A', 'D'), ('B', 'D'), ('D', 'E'), ('C', 'E')]
        self.nodes = sorted(set([i for sub in self.lg_edges for i in sub]))
        self.data = pd.DataFrame(columns=self.nodes)

        self.lg_root_params = [(5, 2), (10, 2), (-5, 2)]
        self.lg_lin_params = [(2, 3), (3, 3)]
        self.lg_var_params = [2,2]
        self.objective_input_set = []
        self.roots = []
        self.non_roots = []
        self.parents_non_roots = []
        self.parent_dict = {}
        self.means = dict(zip(self.nodes,[item[0] for item in self.lg_root_params]))
        self.variance = dict(zip(self.nodes,[item[1] for item in self.lg_root_params]))

    def create_bn_file(self):
        """
        This functions runs all the scripts to construct the Linear Gaussian BN.
        :return (pd.Dataframe): preprocessed data
        """
        self.logger.info("Sart Constructing Network")

        # Change the object types
        self.extract_root_parameters()
        # Deal with awkward column string names
        self.extract_parents()
        # Generate data based on predefined parameters
        self.generate_data()
        # Deal with missing data
        self.make_network()
        # Get analytical means:
        self.analytical_inference_solution()
        # Create filename 
        self.create_file_name()   
        # Write data 
        self.write_data() 
        # Write specifications:
        self.create_json()

    def extract_root_parameters(self):
        "Extract the required input params for root nodes"
        ouput_set = [item[1] for item in self.lg_edges]
        self.roots = [item[0] for item in self.lg_edges if item[0] not in ouput_set]

    def extract_parents(self):
        "Extract the parents for all non root nodes"
        self.non_roots = sorted([item for item in self.nodes if item not in self.roots])
        for node in self.non_roots:
            self.parents_non_roots.append(sorted([item[0] for item in self.lg_edges if item[1] == node]))
        self.parent_dict = dict(zip(self.non_roots,self.parents_non_roots))

    def generate_data(self):
        "Generate root parameters"
        for i in range(len(self.roots)):
            self.data[self.roots[i]] = np.random.normal(self.lg_root_params[i][0], self.lg_root_params[i][1],self.N)

        for i in range(len(self.non_roots)):
            self.data[self.non_roots[i]] = sum(self.lg_lin_params[i][j]*self.data[self.parent_dict[self.non_roots[i]][j]] for j in range(0,len(self.lg_lin_params[i])))
            + np.random.normal(0, self.lg_var_params[i],self.N)

    def make_network(self):
        "Define LG"
        self.lg.set_edges_from(self.lg_edges)
        self.lg.set_data(self.data)

    def run_marginal_inference(self):
        "Run marginal inference with the data via the lg library"
        inference_data = self.lg.run_inference(debug=False)
        return inference_data

    def run_conditional_inference(self, evidence_dict):
        "Run conditional marginal inference with the data via the lg library"
        self.lg.set_evidences(evidence_dict)
        inference_data = self.lg.run_inference(debug=False)
        return inference_data

    def analytical_inference_solution(self):
        "Evaluate the mean of the non-root nodes analytically. Assumes the BN can be evaluated alphabetically"
        for i, (node, mean)  in enumerate(self.parent_dict.items()):
            self.means[node] = sum(self.lg_lin_params[i][j]*self.means[mean[j]] for j in range(0,len(self.lg_lin_params[i])))

    def create_file_name(self):
        "create name and json specifics of network"
        root_text = [f"{self.roots[i]} ~ N({self.lg_root_params[i][0]},{self.lg_root_params[i][0]})" for i in range(len(self.lg_root_params))]
        
        mean_texts = []
        for i, (node, parents) in enumerate(self.parent_dict.items()):
            mean_list = ([f"{self.lg_lin_params[i][j]}{self.parent_dict[node][j]}" for j in range(len(self.parent_dict[node]))])
            mean = '+'.join(mean_list)
            mean_texts.append(mean)   
        non_root_text = [f"{self.non_roots[i]} ~ N({mean_texts[i]},{self.lg_var_params[i]})" for i in range(len(self.non_roots))]
        root_text = ' '.join(root_text)
        non_root_text = ' '.join(non_root_text)

        self.settings_lg = {'distribution':'lg', 'edges': self.lg_edges, 'root_params':root_text, 
               'not_root_params':' '.join(non_root_text), 'sample_size': self.N, 'means': self.means}

    def write_data(self):
        "Write the generated data as csv"
        self.filename = f"{self.settings_lg['distribution']}{self.settings_lg['sample_size']}"
        self.model_path = os.path.join(os.getcwd(), "models/undiscretized_models/")
        self.data.to_csv(self.model_path + self.filename+'.csv', index=False)
    
    def create_json(self):
        "Write the specification of data as json"
        with open(self.model_path+self.filename+"settings.json", "w") as outfile:
            json.dump(self.settings_lg, outfile)


if __name__ == '__main__':
    args = parser.parse_args()
    LG = LG_generator(N=5000)
    LG.create_bn_file()
