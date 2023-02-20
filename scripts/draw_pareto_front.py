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

# Change default plot size
plt.rcParams['figure.figsize'] = (8, 5)
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
        self.settings_json_files = [pos_json for pos_json in os.listdir(model_path) if pos_json.endswith('settings.json')]
        self.ddinfo_json_files = [pos_json for pos_json in os.listdir(model_path) if pos_json.endswith('ddinfo.json')]
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
        # Read info json files:
        self.read_json_info()
        # Preprocess data:
        self.preprocess_data()
        # Read errors for data:
        self.plot_pareto()

    def read_json_settings(self):
        "Read settings json"
        rmses, wmses = [], []
        disc_methods= []
        for json_file in self.settings_json_files:   
            with open(self.model_path+json_file) as json_file:
                opened_data = json.load(json_file)
                rmses.append(opened_data['RMSE']), wmses.append(opened_data['WMSE']), disc_methods.append(opened_data['disc_method']+str(opened_data['bins']) )
        self.error_frame = pd.DataFrame(data=np.transpose([disc_methods, rmses, wmses]), columns=['Disc_method','RMSE','WMSE']) 
        self.error_frame['RMSE'], self.error_frame['WMSE'] = self.error_frame['RMSE'].astype(float), self.error_frame['WMSE'].astype(float)

    def read_json_info(self):
        "Read info json"
        nodecount, load_time = [], []
        for json_file in self.ddinfo_json_files:   
            with open(self.model_path+json_file) as json_file:
                opened_data = json.load(json_file)
                nodecount.append(opened_data['nodecount']), load_time.append(opened_data['load_time'])
        self.error_frame['Nodes'], self.error_frame['load_time'] = nodecount, load_time

    def preprocess_data(self):
        "map data"
        map = {'EB':'Equal Bins','EV':'Equal Values','MD':'Minimum Discription Length'}
        self.error_frame['Method'] = self.error_frame['Disc_method'].str[:2]
        self.error_frame['Method'] = self.error_frame['Method'].map(map)

    def plot_pareto(self):
        "Extract RMSE and WMSE"
        sns.scatterplot(y='Nodes', x='WMSE', data=self.error_frame, size = 8, legend=False, hue='Method') #change when dd size is available
        for i in range(self.error_frame.shape[0]):
            plt.text(y=self.error_frame.Nodes[i],x=self.error_frame.WMSE[i]+(self.error_frame.WMSE.max()*0.005),s=self.error_frame.Disc_method[i], fontsize=11) #change when dd size is available

        plt.title("Paretofront with Weighted Root Mean Squared Error (WRMSE) vs node count of the BDD")
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

