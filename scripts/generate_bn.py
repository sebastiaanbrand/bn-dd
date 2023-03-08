import os
import argparse
from lgnpy import LinearGaussian
import numpy as np
import logging.config
import sys
import pandas as pd
import json
from cdt.data import load_dataset

parser = argparse.ArgumentParser(description='Generate Bayesian Network')
parser.add_argument('distribution', type=str, help='Sort of distribution to consider')
parser.add_argument('experiment', type=int, help='Sort of experiment to consider')

class LG_generator:
    """Creating the linear gaussian Bayesian Network:
    TODO: Generalize making the input lg_edges, root_params and lin_params and computing
    """

    def __init__(self, exp):

            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        logger = logging.getLogger()
        self.logger = logging.getLogger(__name__)

        self.exp = exp
        self.lg = LinearGaussian()
        self.lg_edges = [('A', 'D'), ('B', 'D'), ('D', 'E'), ('C', 'E')]
        self.nodes = sorted(set([i for sub in self.lg_edges for i in sub]))
        self.data = pd.DataFrame(columns=self.nodes)

        if self.exp==1:
            self.lg_root_params = [(20, 2), (20, 2), (15, 2)]
            self.lg_lin_params = [(2, 3), (3, 3)]
            self.lg_var_params = [2,2]
            self.N = 5000
        elif self.exp==2:
            self.lg_root_params = [(20, 5), (20, 5), (15, 5)]
            self.lg_lin_params = [(2, 3), (3, 3)]
            self.lg_var_params = [5,5]
            self.N = 5000
        elif self.exp==3:
            self.lg_root_params = [(20, 2), (20, 2), (15, 2)]
            self.lg_lin_params = [(2, 3), (3, 3)]
            self.lg_var_params = [2,2]
            self.N = 1000
        elif self.exp==4:
            self.lg_root_params = [(20, 5), (20, 5), (15, 5)]
            self.lg_lin_params = [(2, 3), (3, 3)]
            self.lg_var_params = [5,5]
            self.N = 1000
        elif self.exp==5:
            self.lg_root_params = [(20, 2), (20, 2), (15, 2)]
            self.lg_lin_params = [(2, 3), (3, 3)]
            self.lg_var_params = [2,2]
            self.N = 300
        elif self.exp==6:
            self.lg_root_params = [(20, 5), (20, 5), (15, 5)]
            self.lg_lin_params = [(2, 3), (3, 3)]
            self.lg_var_params = [5,5]
            self.N = 300
        
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
        np.random.seed(45)
        for i in range(len(self.roots)):
            self.data[self.roots[i]] = np.random.normal(self.lg_root_params[i][0], int(self.lg_root_params[i][1]),self.N)

        
        for i in range(len(self.non_roots)):
            self.data[self.non_roots[i]] = sum(self.lg_lin_params[i][j]*self.data[self.parent_dict[self.non_roots[i]][j]] for j in range(0,len(self.lg_lin_params[i])))+np.random.normal(0, int(self.lg_var_params[i]),self.N)

    def make_network(self):
        "Define LG"
        self.lg.set_edges_from(self.lg_edges)
        self.lg.set_data(self.data)

    def run_marginal_inference(self):
        "Run marginal inference with the sampled data via the lg library"
        inference_data = self.lg.run_inference(debug=False)
        return inference_data

    def run_conditional_inference(self, evidence_dict):
        "Run conditional marginal inference with the sampled data via the lg library"
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

        self.settings_lg = {'distribution':'lg', 'edges': self.lg_edges, 'root_params':root_text, 'experiment': self.exp, 
               'not_root_params':' '.join(non_root_text), 'sample_size': self.N, 'means': self.means}

    def write_data(self):
        "Write the generated data as csv"
        self.filename = f"{self.settings_lg['distribution']}{self.exp}"
        self.model_path = os.path.join(os.getcwd(), "models/undiscretized_models/")
        self.data.to_csv(self.model_path + self.filename+'.csv', index=False)
    
    def create_json(self):
        "Write the specification of data as json"
        with open(self.model_path+self.filename+"settings.json", "w") as outfile:
            json.dump(self.settings_lg, outfile)


class nm_generator:
    """Creating the normal mixture model Network:
    TODO: Generalize making the input lg_edges, root_params and lin_params and computing
    """

    def __init__(self, exp):

            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        logger = logging.getLogger()
        self.logger = logging.getLogger(__name__)

        self.edges = [('X', 'Y')]
        self.nodes = sorted(set([i for sub in self.edges for i in sub]))
        self.data = pd.DataFrame(columns=self.nodes)
        self.exp = exp

        if self.exp==1:
            self.N = 500
            self.bin_param = 0.5
            self.lg_normal_params = [(21, 10), (25, 1)]
        if self.exp==2:
            self.N = 500
            self.bin_param = 0.8
            self.lg_normal_params = [(21, 10), (25, 1)]
        if self.exp==3:
            self.N = 500
            self.bin_param = 0.5
            self.lg_normal_params = [(6, 2), (4, 2)]
        if self.exp==4:
            self.N = 500
            self.bin_param = 0.8
            self.lg_normal_params = [(6, 2), (4, 2)]
        if self.exp==5:
            self.N = 100
            self.bin_param = 0.5
            self.lg_normal_params = [(21, 10), (25, 1)]
        if self.exp==6:
            self.N = 100
            self.bin_param = 0.8
            self.lg_normal_params = [(21, 10), (25, 1)]
        if self.exp==7:
            self.N = 100
            self.bin_param = 0.5
            self.lg_normal_params = [(6, 2), (4, 2)]
        if self.exp==8:
            self.N = 100
            self.bin_param = 0.8
            self.lg_normal_params = [(6, 2), (4, 2)]

    def create_bn_file(self):
        """
        This functions runs all the scripts to construct the Normal Mixture BN.
        :return (pd.Dataframe): preprocessed data
        """
        self.logger.info("Sart Constructing Network")
        #Generate data
        self.generate_data()
        # Get analytical means:
        self.analytical_inference_solution()
        #Create file name
        self.create_file_name()
        #Write csv
        self.write_data()
        #Write json
        self.create_json()



    def generate_data(self):
        "Generate root parameters"
        np.random.seed(45)
        self.data['X'] = np.random.binomial(size=self.N, p=self.bin_param, n=1)
        self.data['Y'] = [np.random.normal(self.lg_normal_params[0][0], self.lg_normal_params[0][1]) if x == 0 else 
            np.random.normal(self.lg_normal_params[1][0], self.lg_normal_params[1][1]) for x in self.data['X']] 


    def analytical_inference_solution(self):
        "Evaluate the mean of the non-root nodes analytically. Assumes the BN can be evaluated alphabetically"
        self.mean = self.bin_param * self.lg_normal_params[0][0]  + (1-self.bin_param) * self.lg_normal_params[1][0] 

    def create_file_name(self):
        "create name and json specifics of network"
        bin_text = [f"X ~ B({self.bin_param})"]
        
        mean_texts = []
        non_root_text = [f"P(Y|X) ~ N({self.lg_normal_params[i][0]},{self.lg_normal_params[i][1]}) if X = {np.linspace(0,1, num=2)[i]}" for i in range(len(self.lg_normal_params))]
        self.settings = {'distribution':'nm', 'edges': self.edges, 'root_params':bin_text, 'experiment': self.exp,
               'not_root_params': ' and '.join(non_root_text), 'sample_size': self.N, 'means': self.mean}

    def write_data(self):
        "Write the generated data as csv"
        self.filename = f"{self.settings['distribution']}{self.exp}"
        self.model_path = os.path.join(os.getcwd(), "models/undiscretized_models/")
        self.data.to_csv(self.model_path + self.filename+'.csv', index=False)
    
    def create_json(self):
        "Write the specification of data as json"
        with open(self.model_path+self.filename+"settings.json", "w") as outfile:
            json.dump(self.settings, outfile)

class tb_generator:
    """Creating the real tuebinger model Network:
    TODO: Generalize making the input lg_edges, root_params and lin_params and computing
    """

    def __init__(self, exp):

            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        logger = logging.getLogger()
        self.logger = logging.getLogger(__name__)
        mapping_to_pair = {1:3,2:21,3:25,4:26,5:91,6:95}
        self.exp = exp
        self.pair = mapping_to_pair[exp]
        self.edges = [('A', 'B')]
        self.nodes = sorted(set([i for sub in self.edges for i in sub]))
        self.data = pd.DataFrame(columns=self.nodes)

    def create_bn_file(self):
        """
        This functions runs all the scripts to construct the Normal Mixture BN.
        :return (pd.Dataframe): preprocessed data
        """
        self.logger.info("Sart Constructing Network")
        #Generate data
        self.generate_data()
        #Create file name
        self.create_file_name()
        #Write csv
        self.write_data()
        #Write json
        self.create_json()



    def generate_data(self):
        "Generatethe set"
        t_data, t_graph = load_dataset('tuebingen')
        self.data = pd.DataFrame(data = [t_data.loc['pair'+str(self.pair),'A'], t_data.loc['pair'+str(self.pair),'B']]).transpose()
        self.data.columns=['A','B']
        self.N = len(self.data)

    def create_file_name(self):
        "create name and json specifics of network"
        self.settings = {'distribution':'tb','edges': self.edges,'sample_size': self.N, 'experiment': self.exp, 'pair': self.pair}

    def write_data(self):
        "Write the generated data as csv"
        self.filename = f"{self.settings['distribution']}{self.exp}"
        self.model_path = os.path.join(os.getcwd(), "models/undiscretized_models/")
        self.data.to_csv(self.model_path + self.filename+'.csv', index=False)
    
    def create_json(self):
        "Write the specification of data as json"
        with open(self.model_path+self.filename+"settings.json", "w") as outfile:
            json.dump(self.settings, outfile)


if __name__ == '__main__':
    np.random.seed(45)
    args = parser.parse_args()
    distribution = args.distribution
    experiment = args.experiment
    if distribution == 'lg':
        LG = LG_generator(experiment)
        LG.create_bn_file()
    if distribution == 'nm':
        NM = nm_generator(experiment)
        NM.create_bn_file()
    if distribution == 'tb':
        TB = tb_generator(experiment)
        TB.create_bn_file()

