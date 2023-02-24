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
from pgmpy.readwrite import XMLBIFReader
import warnings
from sklearn.metrics import mean_squared_error
from MCMCsampler import McmcSampler
import networkx as nx
from dowhy import CausalModel
from sklearn.preprocessing import MinMaxScaler
import ot

parser = argparse.ArgumentParser(description='Compute Error for Tuebinger Set')
parser.add_argument('filename', type=str, help='path to data BN file')

class MCMC_error:
    """
    Computer the MCMC error of the tuebinger dataset
    """

    def __init__(self, modelpath, filename):

            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        logger = logging.getLogger()
        self.logger = logging.getLogger(__name__)

        reader = XMLBIFReader(model_path+filename+'.xmlbif')
        self.model_struct = reader.get_model()
        self.disc_data = pd.read_csv(model_path+filename+'.csv')
        with open(model_path+filename+'settings.json') as json_file:
            self.settings = json.load(json_file)
        
        model_path2 = os.path.join(os.getcwd(), "models/undiscretized_models/")
        self.data = pd.read_csv(model_path2+'tb'+str(''.join(filter(str.isdigit, filename))[0]) +'.csv')
        self.columns = self.data.columns

    def compute_errors(self):
        """
        This functions runs all the scripts from discretizing the continuous BN till storing the discretized BN.
        """
        self.logger.info("Sart Errors")
        #Create disc network
        self.create_disc_network()
        # Fit data to disc data
        discretized_solutions = self.compute_discretized_conditionals('B','A')
        # Fit data to disc data
        exact_solutions = self.compute_exact_conditionals('B','A')


        self.get_discretized_sample()
        self.scale_data()

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

    def create_disc_network(self):
        "Write the generated data as csv"

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
        
        # Fit Equal Values Bayesian Network
        self.model_struct.fit(self.disc_data)  

        infer = VariableElimination(self.model_struct)
        non_nans_b = [x for x in self.values_dict[inference_col] if str(x) != 'nan']
        solutions = []
        print()
        for value in sorted(self.disc_data[conditional_col].unique()):
            agg_solution = infer.query(variables=[inference_col], evidence={conditional_col: value}).values
            solutions.append(sum(agg_solution * non_nans_b))
        print(solutions)
        return solutions

    def compute_exact_conditionals(self, inference_col, conditional_col):
        "Compute (or approximate) E(inference_col|conditional_col) with the discretized values"
        self.conditional_col=conditional_col
        solutions=[]
        nx.write_gml(nx.DiGraph([('A','B')]), "G.gml") 
        causal_model = CausalModel(data = self.data, treatment=['A'], outcome=['B'], graph= 'G.gml')
        samplerMCMC = McmcSampler(self.data,
                        causal_model=causal_model,
                        keep_original_treatment=False, # False cause we will specify interventions ourselves 
                        variable_types={'A': 'c', 'B': 'c'})
        input_dataframe = pd.DataFrame(data=np.random.choice(a=sorted(self.values_dict[conditional_col]), size=2000), columns=['A'])
        interventional_df = samplerMCMC.do_sample(input_dataframe)
        solutions = interventional_df.groupby(['A'])['B'].mean().values
        print(solutions)
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
        self.model_path = os.path.join(os.getcwd(), "models/tuebingen"+str(''.join(filter(str.isdigit, filename))[0])+"/")

    def create_json(self):
        "Write the specification of data as json"
        with open(self.model_path+self.filename+"settings.json", "w") as outfile:
            json.dump(self.settings, outfile)



if __name__ == '__main__':
    args = parser.parse_args()
    filename = args.filename
    model_path = os.path.join(os.getcwd(), "models/tuebingen"+str(''.join(filter(str.isdigit, filename))[0])  +"/")
    MCMC_error = MCMC_error(model_path,filename)
    MCMC_error.compute_errors()