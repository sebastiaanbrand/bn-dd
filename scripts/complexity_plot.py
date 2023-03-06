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

palettes={'EB5': 'navy', 
        'EB8': 'mediumblue',
        'EB10': 'blue',
        'EB12': 'royalblue',
        'EB14': 'cornflowerblue',
        'EV5': 'darkred', 
        'EV8': 'red',
        'EV10': 'tomato',
        'EV12': 'salmon',
        'EV14': 'lightsalmon',
        'MDLP': 'green'}

errormap ={'Wass1D': '1-dimensional Wasserstein Distance',
        'Wass_multi': 'Multi-dimensional Wasserstein Distance',
        'WRMSE': 'WRMSE',
        'RMSE': 'RMSE',
        'MAE': 'MAE'}

normalize = True

class Complexity:
    """Creating Pareto-front"""
    def __init__(self, model_path):
            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        logger = logging.getLogger()
        self.logger = logging.getLogger(__name__)
        self.model_path = model_path
        self.settings_json_files = [pos_json for pos_json in os.listdir(model_path) if pos_json.endswith('settings.json')]
        self.ddinfo_json_files = [pos_json for pos_json in os.listdir(model_path) if pos_json.endswith('ddinfo.json')]
        self.complexity_plot = pd.DataFrame()

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
        # Draw Front
        self.plot_scatter()

    def read_json_settings(self):
        "Read settings json"
        var_elimination_length = []
        disc_methods= []
        for json_file in self.settings_json_files:   
            with open(self.model_path+json_file) as json_file: 
                opened_data = json.load(json_file)   
                var_elimination_length.append(opened_data['VE_complexity'])
                if opened_data['disc_method']!='MDLP':
                    disc_methods.append(opened_data['disc_method']+str(opened_data['bins']))
                else:
                    disc_methods.append(opened_data['disc_method'])
        self.error_frame = pd.DataFrame(data=np.transpose([disc_methods, var_elimination_length]), columns=['Disc_method','VE_complexity']) 
        self.error_frame['VE_complexity'] = self.error_frame['VE_complexity'].astype(float)

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

    def plot_scatter(self):
        "Plot data"
        sns.set(style='ticks', context='notebook', font_scale=1.2)
        fig, ax = plt.subplots()
        sns.scatterplot(y='Nodes', x='VE_complexity', data=self.error_frame, legend=False, hue='Disc_method', ax=ax,
        palette=palettes, style="Method", size='load_time', sizes=(199,200)) #change when dd size is available
        ax.set(xlabel='Variable Elimination Complexity', ylabel='Nodes')
        plt.title('Experiment '+str(''.join(filter(str.isdigit, distribution))))
        for i in range(self.error_frame.shape[0]):
            plt.text(y=self.error_frame['Nodes'][i],x=self.error_frame['VE_complexity'][i]+(self.error_frame['VE_complexity'].max()*0.015),s=self.error_frame.Disc_method[i], fontsize=11) #change when dd size is available

        save_path = os.path.join(os.getcwd(), "plots/complexity_plot_"+args.distribution+".png")
        plt.savefig(save_path)



if __name__ == '__main__':
    args = parser.parse_args()
    distribution = args.distribution
    if 'lg' in distribution:
        model_path = os.path.join(os.getcwd(), "models/linear_gaussian"+str(''.join(filter(str.isdigit, distribution)))  +"/")
    if 'nm' in distribution:
        model_path = os.path.join(os.getcwd(), "models/normal_mixture"+str(''.join(filter(str.isdigit, distribution)))  +"/")
    if 'tb' in distribution:
        model_path = os.path.join(os.getcwd(), "models/tuebingen"+str(''.join(filter(str.isdigit, distribution)))  +"/")
    Complexity_Plot = Complexity(model_path)
    Complexity_Plot.create_plots()

