import os
import argparse
from lgnpy import LinearGaussian
import numpy as np
import logging.config
import sys
import pandas as pd
import json
import seaborn as sns
import matplotlib.pyplot as plt

parser = argparse.ArgumentParser(description='Draw Pareto Front')
parser.add_argument('distribution', type=str, help='Sort of distribution to consider')

class Pareto:
    """Creating Pareto-front:
    TODO: Generalize making the input lg_edges, root_params and lin_params and computing
    """

    def __init__(self, model_path):
            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        logger = logging.getLogger()
        self.logger = logging.getLogger(__name__)
        self.model_path = model_path
        self.json_files = [pos_json for pos_json in os.listdir(model_path) if pos_json.endswith('.json')]
        self.settings_all = {}
        self.error_frame = pd.DataFrame()

    def create_plots(self):
        """
        This functions runs all the scripts to construct the Normal Mixture BN.
        :return (pd.Dataframe): preprocessed data
        """
        self.logger.info("Sart Creating Plots")
        # Read setting json files
        self.read_json_settings()
        # Read errors for data:
        self.plot_pareto()

    def read_json_settings(self):
        "Read json files and store in dict"
        rmses, wmses = [], []
        disc_methods= []
        for json_file in self.json_files:   
            with open(self.model_path+json_file) as json_file:
                opened_data = json.load(json_file)
                rmses.append(opened_data['RMSE']), wmses.append(opened_data['WMSE']), disc_methods.append(opened_data['disc_method']+str(opened_data['bins']) )
        self.error_frame = pd.DataFrame(data=np.transpose([disc_methods, rmses, wmses]), columns=['Disc_method','RMSE','WMSE']) 
        self.error_frame['RMSE'], self.error_frame['WMSE'] = self.error_frame['RMSE'].astype(float), self.error_frame['WMSE'].astype(float)

    def plot_pareto(self):
        "Extract RMSE and WMSE"
        sns.scatterplot(x='RMSE', y='WMSE', data=self.error_frame, size = 8, legend=False) #change when dd size is available
        for i in range(self.error_frame.shape[0]):
            plt.text(x=self.error_frame.RMSE[i]+0.3,y=self.error_frame.WMSE[i],s=self.error_frame.Disc_method[i]) #change when dd size is available

        plt.title("Paretofront with Weighted Mean Squared Error (WMSE) vs size of the BDD")
        save_path = os.path.join(os.getcwd(), "plots/paretofront_"+args.distribution+".png")
        plt.savefig(save_path)



if __name__ == '__main__':
    args = parser.parse_args()
    distribution = args.distribution
    if distribution == 'lg':
        model_path = os.path.join(os.getcwd(), "models/linear_gaussian/")
    if distribution == 'nm':
        model_path = os.path.join(os.getcwd(), "models/normal_mixture/")
    Pareto_Front = Pareto(model_path)
    Pareto_Front.create_plots()

