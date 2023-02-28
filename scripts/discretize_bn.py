import os
import argparse
from lgnpy import LinearGaussian
import numpy as np
import logging.config
import sys
import pandas as pd
import json
from pgmpy.sampling import BayesianModelSampling
from pgmpy.models import BayesianNetwork
from pgmpy.estimators import MaximumLikelihoodEstimator
from pgmpy.inference import VariableElimination
import warnings
from sklearn.metrics import mean_squared_error
#from MCMCsampler import McmcSampler
import networkx as nx
#from dowhy import CausalModel
from sklearn.preprocessing import MinMaxScaler
import ot

from mdlp.discretization import MDLP

parser = argparse.ArgumentParser(description='Discretize Bayesian Network')
parser.add_argument('filename', type=str, help='path to data BN file')
parser.add_argument('disc_method', type=str, help='discretization method used')
parser.add_argument('bins', type=int, help='bins used in discretization')
parser.add_argument('--target_variable', type=str, help='target variable in case of supervised learning')

class Discretizer:
    """
    Discretize the network given the params.
    TODO: fix MDLP environment install
    """

    def __init__(self, filename, disc_method, bins, target_column=None):

            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        logger = logging.getLogger()
        self.logger = logging.getLogger(__name__)

        self.data = pd.read_csv(filename+'.csv')
        self.exp = int(''.join(filter(str.isdigit, filename)))  
        self.disc_data = pd.DataFrame()

        with open(filename+'settings.json') as json_file:
            self.settings = json.load(json_file)
        self.disc_method = disc_method
        self.columns = self.data.columns
        self.bins = bins
        self.target_column = target_column

        #Enrich settings file
        with open(filename+'settings.json') as json_file:
            self.settings = json.load(json_file)
        self.settings['disc_method'] = self.disc_method
        self.settings['bins'] = self.bins
        self.settings['target_column'] = self.target_column

        # Initiate Bayesian Network Structure
        self.model_struct = BayesianNetwork(ebunch = self.settings['edges'])

    def create_discretization(self):
        """
        This functions runs all the scripts from discretizing the continuous BN till storing the discretized BN.
        """
        self.logger.info("Sart Discretizing")
        #Discretize according to choosing disc method
        if self.disc_method == 'EV':
            self.disc_data = self.discretization_EV()
        if self.disc_method == 'EB':
            self.disc_data = self.discretization_EB()
        if self.disc_method == 'MDLP':
            self.disc_data = self.discretization_MDLP()

        # Fit data to disc data
        self.create_original_network()
        # Fit data to disc data
        self.create_disc_network()

        if self.settings['distribution']=='lg':
            discretized_solutions = self.compute_discretized_conditionals('E','A')
            exact_solutions = self.compute_exact_conditionals('E','A')
        if self.settings['distribution']=='nm':
            discretized_solutions = self.compute_discretized_conditionals('Y','X')
            exact_solutions = self.compute_exact_conditionals('Y','X')
        #if "tb" in self.settings['distribution']:
        #    discretized_solutions = self.compute_discretized_conditionals('B','A')
        #    exact_solutions = self.compute_exact_conditionals('B','A')

        # Get Wasserstein distances:compute_1d_wasserstein
        
        if "tb" not in self.settings['distribution']:
            self.get_discretized_sample()
            self.scale_data()

            if self.settings['distribution']=='lg':
                self.compute_1d_wasserstein('E')
            if self.settings['distribution']=='nm':
                self.compute_1d_wasserstein('Y')
            if "tb" in self.settings['distribution']:
                self.compute_1d_wasserstein('B')

            self.compute_multivariate_wasserstein()

            # Get errors
            rmse = self.compute_RMSE(discretized_solutions,exact_solutions)
            wmse = self.compute_WRMSE(discretized_solutions,exact_solutions)
            mae = self.compute_MAE(discretized_solutions,exact_solutions)

        # Write xml:
        self.write_data()
        # Get json:
        self.create_json()
        # Write disc csb:
        if "tb" in self.settings['distribution']:
            self.write_disc_data()

    def create_original_network(self):
      "Create the network with LG"
      if self.settings['distribution']=='lg':
        self.lg = LinearGaussian()
        self.lg.set_edges_from(self.settings['edges'])
        self.lg.set_data(self.data)

    def discretization_EV(self):
      "Equal values: Discretize according to quantiles"
      data = self.data.copy(deep='False')
      cutpoints = []
      for column in self.columns:
        bins = min(self.bins, data[column].nunique())
        if data[column].dtype == 'int64':
            continue
        data[column], bin = pd.qcut(data[column], q=bins, duplicates='drop', retbins=True)
      return data#, np.vstack(cutpoints)

    def discretization_EB(self):
      "Equal length: Discretize according to bins"
      data = self.data.copy(deep='False')
      cutpoints = []
      for column in self.columns:
        bins=min(self.bins, data[column].nunique())
        data[column], bin = pd.cut(data[column], bins=bins, duplicates='drop', retbins=True)
        #cutpoints.append(bin)
      return data#, np.vstack(cutpoints)

    def discretization_MDLP(self):
      "MDLP discretization"
      if self.settings['distribution']=='nm':
        mdlp = MDLP(min_depth=2)  #The rootvariable should remain binomial    
      else:
        mdlp = MDLP()
      data = self.data.copy(deep='False')
      data[self.target_column] = data[self.target_column].clip(lower=0) # clip the target value to 0 to allow discretization
      disc_mdlp_result = mdlp.fit_transform(data, data[self.target_column])
      disc_mdlp = pd.DataFrame(disc_mdlp_result, columns=self.columns)
      return disc_mdlp

    def create_disc_network(self):
        "Write the generated data as csv"
        # Fit Equal Values Bayesian Network
        self.model_struct.fit(self.disc_data)

        # Compute the weighted average of the discretized bins
        merged_frame = self.data.merge(self.disc_data, left_index=True,right_index=True, suffixes=['_raw','_disc'])
        values = [merged_frame.groupby([col+'_disc'])[col+'_raw'].mean().values for col in self.columns]
        self.values_dict = dict(zip(self.columns,values))

        #Get the probability of these discretized values
        self.dicts = [merged_frame.groupby([col+'_disc'])[col+'_raw'].mean().to_dict() for col in self.data.columns]
        disc_probs =[self.model_struct.get_cpds(col).values for col in self.data.columns]
        self.prob_dict = dict(zip(self.columns,disc_probs))

    def compute_discretized_conditionals(self, inference_col, conditional_col):
        "Compute P(inference_col|conditional_col) with the discretized values"
        infer = VariableElimination(self.model_struct)
        non_nans_b = [x for x in self.values_dict[inference_col] if str(x) != 'nan']
        solutions = []
        for value in sorted(self.disc_data[conditional_col].unique()):
            agg_solution = infer.query(variables=[inference_col], evidence={conditional_col: value}).values
            solutions.append(sum(agg_solution * non_nans_b))
        return solutions

    def compute_exact_conditionals(self, inference_col, conditional_col):
        "Compute (or approximate) E(inference_col|conditional_col) with the discretized values"
        solutions=[]
        self.conditional_col=conditional_col
        if self.settings['distribution']=='lg':
            for value in sorted(self.values_dict[conditional_col]):
                self.lg.set_evidences({conditional_col: value})
                inference = self.lg.run_inference(debug=False)
                solutions.append(inference.loc[inference_col,'Mean_inferred'])
        elif self.settings['distribution']=='nm':
            solutions = self.data.groupby(['X'])['Y'].mean().to_list()
        #elif "tb" in self.settings['distribution']:
            #nx.write_gml(nx.DiGraph([('A','B')]), "G.gml") 
            #causal_model = CausalModel(data = self.data, treatment=['A'], outcome=['B'], graph= 'G.gml')
            #samplerMCMC = McmcSampler(self.data,
            #              causal_model=causal_model,
            #               keep_original_treatment=False, # False cause we will specify interventions ourselves 
            #               variable_types={'A': 'c', 'B': 'c'})
            #input_dataframe = pd.DataFrame(data=np.random.choice(a=sorted(self.values_dict[conditional_col]), size=2000), columns=['A'])
            #interventional_df = samplerMCMC.do_sample(input_dataframe)
            #solutions = interventional_df.groupby(['A'])['B'].mean().values
        return solutions   

    def get_discretized_sample(self):
        # The discretized distribution, we can gather samples from the distribution
        inference = BayesianModelSampling(self.model_struct)
        self.discretized_sample = inference.forward_sample(size=len(self.data))[self.columns]
        for i, col in enumerate(self.columns):
            self.discretized_sample[col] = self.discretized_sample[col].map(self.dicts[i])
        self.discretized_sample.fillna(self.discretized_sample.mean(), inplace=True)

    def compute_RMSE(self, disc_sol, exact_sol):
        "Compute RMSE"
        rms = mean_squared_error(exact_sol, disc_sol, squared=False)
        self.settings['RMSE'] = rms
        return rms

    def compute_WRMSE(self, disc_sol, exact_sol):
        "Compute WRMSE: based on the discretized probabilities of the conditonals P(.)"
        wms = mean_squared_error(exact_sol, disc_sol, sample_weight=self.prob_dict[self.conditional_col], squared=False)
        self.settings['WRMSE'] = wms
        return wms
    
    def compute_MAE(self, disc_sol, exact_sol):
        mae = mean_squared_error(exact_sol, disc_sol)
        self.settings['MAE'] = mae
        return mae       

    def scale_data(self):
        min_scaler = MinMaxScaler()
        min_scaler.fit(self.data[self.columns])
        self.scaled_raw_data = pd.DataFrame(min_scaler.transform(self.data[self.columns]), columns=self.columns)
        min_scaler.fit(self.discretized_sample[self.columns])
        self.scaled_discretized_data = pd.DataFrame(min_scaler.transform(self.discretized_sample[self.columns]), columns=self.columns)

    def compute_1d_wasserstein(self, target_col):
        """Compute 1d wasserstein distance: based on the scaled target distances
        TODO: double check function"""
        a, b = np.ones(len(self.data)) / len(self.data), np.ones(len(self.data)) / len(self.data) 
        M = ot.dist(self.scaled_raw_data[target_col].to_numpy().reshape((len(self.data), 1)), self.scaled_discretized_data[target_col].to_numpy().reshape((len(self.data), 1)), metric='euclidean')
        W1 = ot.emd2(a,b,M, numItermax=1000000)
        self.settings['Wass1D'] = W1

    def compute_multivariate_wasserstein(self):
        """Compute 1d wasserstein distance: based on the (scaled) entire discretization
        TODO: double check function"""
        a, b = np.ones(len(self.data)) / len(self.data), np.ones(len(self.data)) / len(self.data) 
        M = ot.dist(self.scaled_raw_data[self.columns].to_numpy(), 
                    self.scaled_discretized_data[self.columns].to_numpy(), metric='euclidean')     
        W1 = ot.emd2(a,b,M, numItermax=1000000)
        self.settings['Wass_multi'] = W1

    def write_data(self):
        "Write the generated data as csv"
        if self.settings['disc_method']!='MDLP': 
            self.filename = f"data_{self.settings['distribution']}_{self.settings['disc_method']}{self.settings['bins']}"
        else:
            self.filename = f"data_{self.settings['distribution']}_{self.settings['disc_method']}"
        if self.settings['distribution']=='lg':
            self.model_path = os.path.join(os.getcwd(), "models/linear_gaussian"+str(self.exp)+"/")
        elif self.settings['distribution']=='nm':
            self.model_path = os.path.join(os.getcwd(), "models/normal_mixture"+str(self.exp)+"/")
        elif "tb" in self.settings['distribution']:
            self.model_path = os.path.join(os.getcwd(), "models/tuebingen"+str(self.exp)+"/")
        self.model_struct.save(self.model_path+self.filename+'.xmlbif', filetype='xmlbif')

    def write_disc_data(self):
        "Write discretized data"
        self.disc_data.to_csv(self.model_path + self.filename+'.csv', index=False)

    def create_json(self):
        "Write the specification of data as json"
        with open(self.model_path+self.filename+"settings.json", "w") as outfile:
            json.dump(self.settings, outfile)


if __name__ == '__main__':
    args = parser.parse_args()
    filename = args.filename
    disc_method = args.disc_method
    bins = args.bins
    target_col = args.target_variable
    model_path = os.path.join(os.getcwd(), "models/undiscretized_models/")
    Discretization = Discretizer(model_path+filename, disc_method, bins, target_col)
    Discretization.create_discretization()
