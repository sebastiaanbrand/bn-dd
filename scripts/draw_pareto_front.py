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
parser.add_argument('error', type=str, help='Error to draw in paretofront')

palettes={'EB5': 'navy', 
        'EB8': 'royalblue',
        'EB10': 'dodgerblue',
        'EB12': 'lightskyblue',
        'EB14': 'powderblue',
        'EV5': 'maroon', 
        'EV8': 'red',
        'EV10': 'tomato',
        'EV12': 'salmon',
        'EV14': 'mistyrose',
        'MDLP': 'green'}

class Pareto:
    """Creating Pareto-front"""
    def __init__(self, model_path, error):
            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        logger = logging.getLogger()
        self.logger = logging.getLogger(__name__)
        self.model_path = model_path
        self.settings_json_files = [pos_json for pos_json in os.listdir(model_path) if pos_json.endswith('settings.json')]
        self.ddinfo_json_files = [pos_json for pos_json in os.listdir(model_path) if pos_json.endswith('ddinfo.json')]
        self.settings_all = {}
        self.error = error
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
        # Get non-dominated solutions:
        self.non_dominant_solutions(self.error)
        # Draw Front
        self.plot_pareto(self.error)

    def read_json_settings(self):
        "Read settings json"
        rmses, wmses = [], []
        disc_methods= []
        wass_1d, wass_multi = [], []
        for json_file in self.settings_json_files:   
            with open(self.model_path+json_file) as json_file:
                opened_data = json.load(json_file)
                rmses.append(opened_data['RMSE']), wmses.append(opened_data['WRMSE'])
                wass_1d.append(opened_data['Wass1D']), wass_multi.append(opened_data['Wass_multi'])
                if opened_data['disc_method']!='MDLP':
                    disc_methods.append(opened_data['disc_method']+str(opened_data['bins']))
                else:
                    disc_methods.append(opened_data['disc_method'])
        self.error_frame = pd.DataFrame(data=np.transpose([disc_methods, rmses, wmses, wass_1d, wass_multi ]), columns=['Disc_method','RMSE','WRMSE', 'Wass1D','Wass_multi']) 
        self.error_frame['RMSE'], self.error_frame['WRMSE'] = self.error_frame['RMSE'].astype(float), self.error_frame['WRMSE'].astype(float)
        self.error_frame['Wass1D'], self.error_frame['Wass_multi'] = self.error_frame['Wass1D'].astype(float), self.error_frame['Wass_multi'].astype(float)

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

    def non_dominant_solutions(self, error):
        self.non_dom_sol = self.error_frame.copy()
        drop_indices=[]
        for index, row in self.error_frame.iterrows():
            for index2, row2 in self.error_frame.iterrows():
                if (row[error]>row2[error]) & (row['Nodes']>row2['Nodes']):
                    drop_indices.append(index)
    
        self.non_dom_sol = self.non_dom_sol.drop(drop_indices)
        #index_node = self.non_dom_sol.idxmin(numeric_only=True)['Nodes']
        #error_node = self.non_dom_sol.idxmin(numeric_only=True)[str(error)]
        #self.non_dom_sol.append()
        
    def plot_pareto(self, error):
        "Plot data"
        sns.set(style='ticks', context='notebook', font_scale=1.2)
        fig, ax = plt.subplots()
        sns.scatterplot(y='Nodes', x=str(error), data=self.error_frame, size = 8, legend=False, hue='Disc_method', ax=ax,
        palette=palettes) #change when dd size is available
        axe = sns.lineplot(data=self.non_dom_sol, x=str(error), y='Nodes',estimator='max', color='gainsboro')
        axe.lines[0].set_linestyle("--")
        print(self.error_frame)
        for i in range(self.error_frame.shape[0]):
            plt.text(y=self.error_frame['Nodes'][i],x=self.error_frame[str(error)][i]+(self.error_frame[str(error)].max()*0.005),s=self.error_frame.Disc_method[i], fontsize=11) #change when dd size is available

        #plt.title("Paretofront with Weighted Root Mean Squared Error (WRMSE) vs node count of the BDD")
        save_path = os.path.join(os.getcwd(), "plots/paretofront_"+args.distribution+"_"+error+".png")
        plt.savefig(save_path)



if __name__ == '__main__':
    args = parser.parse_args()
    distribution = args.distribution
    error = args.error
    if 'lg' in distribution:
        model_path = os.path.join(os.getcwd(), "models/linear_gaussian"+str(''.join(filter(str.isdigit, distribution)))  +"/")
    if 'nm' in distribution:
        model_path = os.path.join(os.getcwd(), "models/normal_mixture"+str(''.join(filter(str.isdigit, distribution)))  +"/")
    Pareto_Front = Pareto(model_path, error)
    Pareto_Front.create_plots()

