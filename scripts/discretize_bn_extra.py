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
from pgmpy.estimators import BayesianEstimator
#sys.path.insert(1,os.path.join(os.getcwd(), "dynamic-discretization/"))
#from src.discretization import prepare_dynamic
#from CAIM import CAIM, parse_field_arguments

parser = argparse.ArgumentParser(description='Discretize Bayesian Network')
parser.add_argument('filename', type=str, help='path to data BN file')
parser.add_argument('disc_method', type=str, help='discretization method used')
parser.add_argument('bins', type=int, help='bins used in discretization')
parser.add_argument('--target_variable', type=str, choices=['B','Y','E','re78'], help='target variable in case of supervised learning')
parser.add_argument('--output_type', type=str, choices=['cnf','xmlbif','net'], help='format to write BN in, default=cnf', default='cnf')
parser.add_argument('--CPT_method', type=str, choices=['MLE','Bayes','Bayespriors'], help='method to infer CPT, default=MLE', default='MLE')


class Discretizer:
    """
    Discretize the network given the params.
    TODO: fix MDLP environment install
    """

    def __init__(self, filename, disc_method, bins, target_column=None, cpt_fit_method=None):
        # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        self.logger = logging.getLogger(__name__)
        self.data = pd.read_csv(filename+'.csv')
        self.data = self.data.loc[:, ~self.data.columns.str.contains('Unnamed')]
        self.data = self.data.iloc[:10000] #cap on 10000
        self.columns = self.data.columns
        self.exp = int(''.join(filter(str.isdigit, filename)))  
        self.disc_data = pd.DataFrame()

        with open(filename+'settings.json') as json_file:
            self.settings = json.load(json_file)
        self.settings['disc_method']  = self.disc_method = disc_method
        self.settings['bins'] = self.bins = bins
        self.settings['target_column'] = self.target_column = target_column
        self.settings['CPT_method'] = self.cpt_fit_method = cpt_fit_method

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
        if self.disc_method == 'CAIM':
            self.disc_data = self.discretization_CAIM()
        if self.disc_method == 'DD':
            self.disc_data = self.discretization_DD()
        self.create_disc_network()

        self.settings['time_disc'] = timeit.default_timer()-time_disc
        time_cnf= timeit.default_timer()
        # Write xml:
        self.write_data(write_as)
        self.settings['time_cnf'] = timeit.default_timer()-time_cnf
        # Get json:
        self.create_json()
        # Get value_dict
        self.create_value_dict()
        # Write disc csb:
        self.write_disc_data()


    def discretization_EV(self):
      "Equal values: Discretize according to quantiles"
      data = self.data.copy(deep='False')
      cutpoints = []
      for column in self.columns:
        bins = min(self.bins, data[column].nunique())
        if self.data[column].dtype=='object':
            self.data[column] = pd.Categorical(self.data[column]).codes
        elif data[column].isin([0,1,2]).all():
            continue
        else:    
          data[column], bin = pd.qcut(data[column], q=bins, duplicates='drop', retbins=True)
      return data

    def discretization_EB(self):
      "Equal length: Discretize according to bins"
      data = self.data.copy(deep='False')
      for column in self.columns:
        bins = min(self.bins, data[column].nunique())
        if data[column].isin([0,1,2]).all():
            continue
        else:    
          data[column], bin = pd.cut(data[column], bins=self.bins, duplicates='drop', retbins=True)
      return data

    def discretization_MDLP(self, min_length=2):
      "MDLP discretization"
      mdlp = MDLP(min_depth=min_length)
      data = self.data.clip(lower=0) #mdlp does not work for negative data, but none of our data is negative
      disc_mdlp_result = mdlp.fit_transform(data, data[self.target_column])
      disc_mdlp = pd.DataFrame(disc_mdlp_result, columns=self.columns)
      if config.sort_mapping[self.settings['distribution']]=='causal': #Ensure the treatment variable remains binary for causal networks
          disc_mdlp[config.source_mapping[self.settings['distribution']]] = data[config.source_mapping[self.settings['distribution']]]
      return disc_mdlp
    
    # def discretization_DD(self):
    #   "MDLP discretization"
    #   data = self.data.copy(deep='False')
    #   disc_dd = prepare_dynamic(data, self.bins)
    #   return disc_dd

    # def discretization_CAIM(self):
    #   "MDLP discretization"
    #   input_df = self.data.copy(deep='False')
    #   feature_fields, target_field = parse_field_arguments(input_df.columns,
    #                                                      self.target_column)
    #   feature_fields = list(input_df[feature_fields].columns[input_df[feature_fields].dtypes != 'object'])
    #   caim = CAIM().fit(input_df[feature_fields],
    #                   input_df[target_field],-1)
    #   final_data = caim.predict(input_df[feature_fields]).join(input_df[target_field])
    #   return final_data

    def construct_prior(self):
        "Get informative priors based on MLE"
        model_struct_prior = self.model_struct.copy()
        model_struct_prior.fit(self.disc_data)
        disc_probs =[model_struct_prior.get_cpds(col).values for col in self.disc_data.columns]
        prior = dict(zip(self.disc_data.columns,disc_probs))
        outgoing_nodes = set()
        incoming_nodes = set()
        # Iterate over the edges to fill the sets
        for edge in self.settings['edges']:
            outgoing_nodes.add(edge[0])
            incoming_nodes.add(edge[1])
        # Nodes that have both incoming and outgoing edges
        both_directions = outgoing_nodes.intersection(incoming_nodes)
        for col in self.disc_data.columns:
            print(col)
            if col == config.sink_mapping[self.settings['distribution']] or col in config.sink_mapping[self.settings['distribution']]:
                prior[col] = np.array(np.array_split(prior[col].flatten(),self.disc_data[col].unique().size))
                prior[col][prior[col]==0]=0.000001
            elif col == config.source_mapping[self.settings['distribution']] or col in config.source_mapping[self.settings['distribution']]:
                prior[col] = np.array(np.array_split(prior[col].flatten(),self.disc_data[col].unique().size))
                prior[col][prior[col]==0]=0.000001
            elif col in both_directions:
                prior[col] = np.array(np.array_split(prior[col].flatten(),self.disc_data[col].unique().size))
                prior[col][prior[col]==0]=0.000001
            elif self.disc_data[col].isin([0,1]).all():
                prior[col] = (prior[col]).reshape(2,1)
                prior[col][prior[col]==0]=0.000001
            elif self.disc_data[col].isin([0,1,2]).all():
                prior[col] = (prior[col]).reshape(3,1)
                prior[col][prior[col]==0]=0.000001
            else:
                prior[col] = (prior[col]).reshape(len(prior[col]),1)
                prior[col][prior[col]==0]=0.000001
        return prior

    def create_disc_network(self):
        "Write the generated data as csv"
        # Fit Equal Values Bayesian Network
        if self.cpt_fit_method == 'MLE':
            self.model_struct.fit(self.disc_data)
        elif self.cpt_fit_method == 'Bayes':
            self.model_struct.fit(self.disc_data, estimator=BayesianEstimator, prior_type="dirichlet", pseudo_counts=1)
        elif self.cpt_fit_method == 'Bayespriors':
            prior = self.construct_prior()
            self.model_struct.fit(self.disc_data, estimator=BayesianEstimator, prior_type="dirichlet", pseudo_counts=prior)

        # Compute the weighted average of the discretized bins
        merged_frame = self.data.merge(self.disc_data, left_index=True,right_index=True, suffixes=['_raw','_disc'])
        values = [merged_frame.groupby([col+'_disc'])[col+'_raw'].mean().values for col in self.columns]
        self.values_dict = dict(zip(self.columns,values))

        #Get the probability of these discretized values
        self.dicts = [merged_frame.groupby([col+'_disc'])[col+'_raw'].mean().to_dict() for col in self.data.columns]
        disc_probs =[self.model_struct.get_cpds(col).values for col in self.data.columns]
        self.prob_dict = dict(zip(self.columns,disc_probs))

        #infer = VariableElimination(self.model_struct)
        #infer_result = infer.query(variables=["ACLED_fatalities_total"]).values
        #target_var_values = [x for x in self.values_dict["ACLED_fatalities_total"] if str(x) != 'nan']


    def write_data(self, write_as : str):
        """Write the generated data as csv"""
        if self.settings['disc_method']!='MDLP': 
            self.filename = f"data_{self.settings['distribution']}_{self.settings['disc_method']}{self.settings['bins']}"
        else:
            self.filename = f"data_{self.settings['distribution']}_{self.settings['disc_method']}"
        self.model_path = os.path.join(os.getcwd(), "models/"+config.dist_mapping[self.settings['distribution']]+str(self.exp)+str(self.cpt_fit_method)+"/")

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

    def create_value_dict(self):
        nested_dict = {}
        for key, array in self.values_dict.items():
            nested_dict[key] = {index: value for index, value in enumerate(array)}
        json_name_dict = self.model_path + self.filename+ '_value_dict.json'
        with open(json_name_dict, "w") as outfile:
            json.dump(nested_dict, outfile)

    def return_error_files(self):
       "returns the necessary files to compute the errors"
       return self.disc_data, self.values_dict, self.prob_dict, self.dicts, self.model_struct, self.json_name, self.settings



if __name__ == '__main__':
    args = parser.parse_args()
    filename = args.filename
    disc_method = args.disc_method
    bins = args.bins
    target_col = args.target_variable
    cpt_fit_method = args.CPT_method
    model_path = os.path.join(os.getcwd(), "models/undiscretized_models/")
    Discretization = Discretizer(model_path+filename, disc_method, bins, target_col, cpt_fit_method)
    Discretization.create_discretization(args.output_type)
    disc_data, values_dict, prob_dict, dicts, model_struct, json_name, settings  = Discretization.return_error_files()
