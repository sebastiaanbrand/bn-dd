import os
import argparse
from lgnpy import LinearGaussian
import numpy as np
import logging.config
import sys
import pandas as pd
import timeit
import json
import math
from pgmpy.sampling import BayesianModelSampling
from pgmpy.models import BayesianNetwork
from pgmpy.inference import VariableElimination, BeliefPropagation, CausalInference
from pgmpy.readwrite import XMLBIFWriter, NETWriter
sys.path.insert(1,os.path.join(os.getcwd(), "conf/"))
import generate_config as config
from bn_to_cnf import write_bn_to_cnf
from sklearn.metrics import mean_squared_error, mean_absolute_error
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
parser.add_argument('--output_type', type=str, choices=['cnf','xmlbif','net'], help='format to write BN in, default=cnf', default='cnf')

class Discretizer:
    """
    Discretize the network given the params.
    TODO: fix MDLP environment install
    """

    def __init__(self, filename, disc_method, bins, target_column=None):
        # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        self.logger = logging.getLogger(__name__)
        self.data = pd.read_csv(filename+'.csv')
        self.exp = int(''.join(filter(str.isdigit, filename)))  
        self.disc_data = pd.DataFrame()

        with open(filename+'settings.json') as json_file:
            self.settings = json.load(json_file)
        self.settings['disc_method']  = self.disc_method = disc_method
        self.columns = self.data.columns
        self.settings['bins'] = self.bins = bins
        self.settings['target_column'] = self.target_column = target_column
        self.model_struct = BayesianNetwork(ebunch = self.settings['edges'])

    def create_discretization(self, write_as : str):
        """
        This functions runs all the scripts from discretizing the continuous BN till storing the discretized BN.
        """
        self.logger.info("Sart Discretizing")
        time_disc= timeit.default_timer()
        #Discretize according to choosing disc method
        if self.disc_method == 'EV':
            self.disc_data = self.discretization_EV()
        if self.disc_method == 'EB':
            self.disc_data = self.discretization_EB()
        if self.disc_method == 'MDLP':
            self.disc_data = self.discretization_MDLP()

        self.create_disc_network()
        self.settings['time_disc'] = timeit.default_timer()-time_disc
        time_cnf= timeit.default_timer()
        # Write xml:
        self.write_data(write_as)
        self.settings['time_cnf'] = timeit.default_timer()-time_cnf
        # Get json:
        self.create_json()
        # Write disc csb:
        self.write_disc_data()


    def discretization_EV(self):
      "Equal values: Discretize according to quantiles"
      data = self.data.copy(deep='False')
      cutpoints = []
      for column in self.columns:
        bins = min(self.bins, data[column].nunique())
        if data[column].isin([0,1]).all():
            continue
        else:    
          data[column], bin = pd.qcut(data[column], q=bins, duplicates='drop', retbins=True)
      return data

    def discretization_EB(self):
      "Equal length: Discretize according to bins"
      data = self.data.copy(deep='False')
      for column in self.columns:
        bins = min(self.bins, data[column].nunique())
        if data[column].isin([0,1]).all():
            continue
        else:    
          data[column], bin = pd.qcut(data[column], q=bins, duplicates='drop', retbins=True)
      return data

    def discretization_MDLP(self, min_length=2):
      "MDLP discretization"
      mdlp = MDLP()
      data = self.data.clip(lower=-50)
      disc_mdlp_result = mdlp.fit_transform(data, data[self.target_column])
      disc_mdlp = pd.DataFrame(disc_mdlp_result, columns=self.columns)
      cutpoints_MLDP = mdlp.cut_points_
      for i in range(len(cutpoints_MLDP)):
        cutpoints_MLDP[i] = np.append(cutpoints_MLDP[i], float('inf'))
        cutpoints_MLDP[i]  = np.append(float('-inf'), cutpoints_MLDP[i])
      cutpoints_MLDP =[cutpoints_MLDP[i] for i in range(len(cutpoints_MLDP))]
      cutpoints_MLDP = np.array(cutpoints_MLDP)
      return disc_mdlp, cutpoints_MLDP
    
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

    def write_data(self, write_as : str):
        """Write the generated data as csv"""
        if self.settings['disc_method']!='MDLP': 
            self.filename = f"data_{self.settings['distribution']}_{self.settings['disc_method']}{self.settings['bins']}"
        else:
            self.filename = f"data_{self.settings['distribution']}_{self.settings['disc_method']}"
        self.model_path = os.path.join(os.getcwd(), "models/"+config.dist_mapping[self.settings['distribution']]+str(self.exp)+"/")

        # write BN
        if write_as == 'xmlbif':
            writer = XMLBIFWriter(self.model_struct)
            writer.write_xmlbif(self.model_path+self.filename+'.xmlbif')
        elif write_as == 'net':
            writer = NETWriter(self.model_struct)
            writer.write_net(self.model_path+self.filename+'.net')
        elif write_as == 'cnf':
            write_bn_to_cnf(self.model_struct, self.model_path+self.filename)

    def write_disc_data(self):
        "Write discretized data"
        self.disc_data.to_csv(self.model_path + self.filename+'.csv', index=False)

    def create_json(self):
        "Write the specification of data as json"
        self.json_name = self.model_path+self.filename+"settings.json"
        with open(self.json_name, "w") as outfile:
            json.dump(self.settings, outfile)
    
    def return_error_files(self):
       "returns the necessary files to compute the errors"
       return self.disc_data, self.values_dict, self.prob_dict, self.dicts, self.model_struct, self.json_name




class Error_computer:
    """
    Computing errors
    """

    def __init__(self, filename, disc_data, model_struct, values_dict, prob_dict, dicts, json_name):

            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        self.logger = logging.getLogger(__name__)
        self.data = pd.read_csv(filename+'.csv')

        with open(filename+'settings.json') as json_file:
            self.settings = json.load(json_file)
        self.columns = self.data.columns
        self.disc_data = disc_data
        self.prob_dict = prob_dict
        self.dicts = dicts
        self.model_struct = model_struct
        self.values_dict = values_dict
        self.json_name=json_name

        disc_EV = self.compute_discretized_EV(config.sink_mapping[self.settings['distribution']])
        exact_EV =  self.compute_exact_EV(config.sink_mapping[self.settings['distribution']])
        discretized_solutions = self.compute_discretized_conditionals(config.sink_mapping[self.settings['distribution']],
                                                                      config.source_mapping[self.settings['distribution']])
        exact_solutions = self.compute_exact_conditionals(config.sink_mapping[self.settings['distribution']],
                                                                      config.source_mapping[self.settings['distribution']])
        if self.settings['distribution']!='tb':
            self.compute_RMSE(discretized_solutions,exact_solutions)
            self.compute_WRMSE(discretized_solutions,exact_solutions)
            self.compute_MAE(discretized_solutions,exact_solutions)
            self.compute_PE(disc_EV,exact_EV)

        time_wass= timeit.default_timer()
        self.scale_data()
        self.compute_scaled_multivariate_wasserstein()
        self.compute_multivariate_wasserstein()
        self.inference_timing(config.sink_mapping[self.settings['distribution']])

        self.settings['time_wass'] = timeit.default_timer()-time_wass
        # Get json:
        self.create_json()

    def compute_discretized_EV(self, inference_col):
        "Compute P(inference_col) with the discretized values"
        time_VE= timeit.default_timer()
        non_nans_b = [x for x in self.values_dict[inference_col] if str(x) != 'nan']
        infer = VariableElimination(self.model_struct)
        infer_result = infer.query(variables=[inference_col], evidence=None)
        expected_value = sum(infer_result.values * non_nans_b)
        self.settings['time_VE'] = timeit.default_timer()-time_VE
        return expected_value

    def inference_timing(self, inference_col):
        "Compute P(inference_col) with the discretized values"
        time_BP= timeit.default_timer()
        infer = BeliefPropagation(self.model_struct)
        infer_result = infer.query(variables=[inference_col], evidence=None)
        self.settings['time_BP'] = timeit.default_timer()-time_BP
        time_CI= timeit.default_timer()
        infer = CausalInference(self.model_struct)
        infer_result = infer.query(variables=[inference_col], evidence=None)
        self.settings['time_CI'] = timeit.default_timer()-time_CI

    def compute_discretized_conditionals(self, inference_col, conditional_col):
        "Compute P(inference_col|conditional_col) with the discretized values"
        infer = VariableElimination(self.model_struct)
        non_nans_b = [x for x in self.values_dict[inference_col] if str(x) != 'nan']
        solutions = []
        for value in sorted(self.disc_data[conditional_col].unique()):
            agg_solution = infer.query(variables=[inference_col], evidence={conditional_col: value}).values
            solutions.append(sum(agg_solution * non_nans_b))
        return solutions

    def compute_exact_EV(self, inference_col):
        "Compute E(inference_col with the exact values)"
        if self.settings['distribution']=='lg':
            solution = self.settings['means'][str(config.sink_mapping[self.settings['distribution']])]
        elif self.settings['distribution']=='nm':
            solution = self.settings['means']
        else:
            solution = np.nan
        return solution

    def compute_exact_conditionals(self, inference_col, conditional_col):
        "Compute (or approximate) E(inference_col|conditional_col) with the exact values"
        solutions=[]
        self.conditional_col=conditional_col
        if self.settings['distribution']=='lg':
            self.lg = LinearGaussian()
            self.lg.set_edges_from(self.settings['edges'])
            self.lg.set_data(self.data)
            for value in sorted(self.values_dict[conditional_col]):
                if not math.isnan(value):
                    self.lg.set_evidences({conditional_col: value})
                    inference = self.lg.run_inference(debug=False)
                    solutions.append(inference.loc[inference_col,'Mean_inferred'])
        elif self.settings['distribution']=='nm':
            solutions = self.data.groupby(['X'])['Y'].mean().to_list()
        else:
            solutions = np.nan
        return solutions   

    def get_discretized_sample(self):
        # The discretized distribution, we can gather samples from the distribution
        inference = BayesianModelSampling(self.model_struct)
        self.discretized_sample = inference.forward_sample(size=len(self.data))[self.columns]
        for i, col in enumerate(self.columns):
            self.discretized_sample[col] = self.discretized_sample[col].map(self.dicts[i])
        self.discretized_sample.fillna(self.discretized_sample.mean(), inplace=True)

    def compute_PE(self, disc_EV, exact_EV):
        "Compute RMSE"
        pe = abs(exact_EV-disc_EV)/disc_EV*100
        self.settings['PE'], self.settings['exact_EV'], self.settings['disc_EV']  = pe, exact_EV, disc_EV

    def compute_RMSE(self, disc_sol, exact_sol):
        "Compute RMSE"
        rms = mean_squared_error(exact_sol, disc_sol, squared=False)
        self.settings['RMSE'] = rms

    def compute_WRMSE(self, disc_sol, exact_sol):
        "Compute WRMSE: based on the discretized probabilities of the conditonals P(.)"
        wms = mean_squared_error(exact_sol, disc_sol, sample_weight=self.prob_dict[self.conditional_col], squared=False)
        self.settings['WRMSE'] = wms
    
    def compute_MAE(self, disc_sol, exact_sol):
        mae = mean_absolute_error(exact_sol, disc_sol)
        self.settings['MAE'] = mae     

    def scale_data(self):
        min_scaler = MinMaxScaler()
        min_scaler.fit(self.data[self.columns])
        self.scaled_raw_data = pd.DataFrame(min_scaler.transform(self.data[self.columns]), columns=self.columns)
        for i, col in enumerate(self.columns):
            self.disc_data[col] = self.disc_data[col].map(self.dicts[i])
        min_scaler.fit(self.disc_data[self.columns]) 
        self.scaled_discretized_data = pd.DataFrame(min_scaler.transform(self.disc_data[self.columns]), columns=self.columns)

    def compute_scaled_multivariate_wasserstein(self):
        """Compute 1d wasserstein distance: based on the entire discretization
        TODO: double check function"""
        a, b = np.ones(len(self.data)) / len(self.data), np.ones(len(self.data)) / len(self.data) 
        M = ot.dist(self.scaled_raw_data[self.columns].to_numpy(), 
                    self.scaled_discretized_data[self.columns].to_numpy(), metric='euclidean')     
        W1 = ot.emd2(a,b,M, numItermax=1000000)
        self.settings['Wass_scaled'] = W1

    def compute_multivariate_wasserstein(self):
        """Compute 1d wasserstein distance: based on the entire discretization
        TODO: double check function"""
        a, b = np.ones(len(self.data)) / len(self.data), np.ones(len(self.data)) / len(self.data) 
        M = ot.dist(self.data[self.columns].to_numpy(), 
                    self.disc_data[self.columns].to_numpy(), metric='euclidean')     
        W1 = ot.emd2(a,b,M, numItermax=1000000)
        self.settings['Wass_multi'] = W1

    def create_json(self):
        "Write the specification of data as json"
        with open(self.json_name, "w") as outfile:
            json.dump(self.settings, outfile)



if __name__ == '__main__':
    args = parser.parse_args()
    filename = args.filename
    disc_method = args.disc_method
    bins = args.bins
    target_col = args.target_variable
    model_path = os.path.join(os.getcwd(), "models/undiscretized_models/")
    Discretization = Discretizer(model_path+filename, disc_method, bins, target_col)
    Discretization.create_discretization(args.output_type)
    disc_data, values_dict, prob_dict, dicts, model_struct, json_name  = Discretization.return_error_files()
    Errors = Error_computer(model_path+filename, disc_data, model_struct, values_dict, prob_dict, dicts, json_name)
