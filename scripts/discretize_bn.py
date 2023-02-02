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
#from mdlp.discretization import MDLP

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
            self.disc_data, cutpoints= self.discretization_EV
        if self.disc_method == 'EB':
            self.disc_data, cutpoints= self.discretization_EB
        if self.disc_method == 'MDLP':
            self.disc_data, cutpoints= self.discretization_MDLP
        # Deal with missing data
        self.make_network()
        # Get analytical means:
        self.write_data()


    def discretization_EV(self):
      "Equal values: Discretize according to quantiles"
      data = self.data.copy(deep='False')
      cutpoints = []
      for column in self.columns:
        data[column], bin = pd.qcut(data[column], q=self.quantiles, duplicates='drop', retbins=True)
        cutpoints.append(bin)
      return data, np.vstack(cutpoints)

    def discretization_EB(self):
      "Equal length: Discretize according to bins"
      data = self.data.copy(deep='False')
      cutpoints = []
      for column in self.columns:
        data[column], bin = pd.cut(data[column], bins=self.bins, duplicates='drop', retbins=True)
        cutpoints.append(bin)
      return data, np.vstack(cutpoints)

    def discretization_MDLP(self):
      "MDLP discretization"
      mdlp = MDLP()
      data = self.data.copy(deep='False')
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
        #Learn Max likelihood Estimator
        mle = MaximumLikelihoodEstimator(model=model_struct, data=disc_data)
        # Estimating CPDs for all the nodes in the model
        all_cpds = mle.get_parameters() 
        # Fit Equal Values Bayesian Network
        self.model_struct.fit(self.disc_data)

        # Compute the weighted average of the discretized bins
        merged_frame = self.data.merge(self.disc_data, left_index=True,right_index=True, suffixes=['_raw','_disc'])
        values = [merged_frame.groupby([col+'_disc'])[col+'_raw'].mean().values for col in self.columns]

        #Get the probability of these discretized values
        dicts = [merged_frame.groupby([col+'_disc'])[col+'_raw'].mean().to_dict() for col in data.columns]
        disc_probs =[model_struct.get_cpds(col).values for col in data.columns]

    def compute_RMSE_conditionals(self):
        print('Use functions from pgmpy library here')


    def write_data(self):
        "Write the generated data as csv"
        print(self.settings)
        self.filename = f"data_{self.settings['distribution']}_{self.settings['disc_method']}{self.settings['bins']}"
        self.model_path = os.path.join(os.getcwd(), "models/linear_gaussian/")
        self.model_struct.save(self.model_path+self.filename+'.xmlbif', filetype='xmlbif')
    
    def create_json(self):
        "Write the specification of data as json"
        with open(self.model_path+self.filename+"settings.json", "w") as outfile:
            json.dump(self.settings_lg, outfile)


if __name__ == '__main__':
    args = parser.parse_args()
    filename = args.filename
    disc_method = args.disc_method
    bins = args.bins
    model_path = os.path.join(os.getcwd(), "models/undiscretized_models/")
    print(model_path+filename)
    Discretization = Discretizer(model_path+filename, disc_method, bins)
    Discretization.write_data()
