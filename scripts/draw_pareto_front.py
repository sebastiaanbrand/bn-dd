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
import matplotlib.animation as animation

# Change default plot size
plt.rcParams['figure.figsize'] = (8, 5.5)
parser = argparse.ArgumentParser(description='Draw Pareto Front')
parser.add_argument('distribution', type=str, help='Sort of distribution to consider')
parser.add_argument('error', type=str, help='Error to draw in paretofront')

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

namemap={'EB5': 'EW5', 
        'EB8': 'EW8',
        'EB10': 'EW10',
        'EB12': 'EW12',
        'EB14': 'EW14',
        'EV5': 'EF5', 
        'EV8': 'EF8',
        'EV10': 'EF10',
        'EV12': 'EF12',
        'EV14': 'EF14',
        'MDLP': 'MDLP'}

errormap ={#'Wass1D': '1-dimensional Wasserstein Distance',
        'Wass_multi': "Earth Mover's Distance",
        'WRMSE': 'WRMSE',
        'RMSE': 'RMSE',
        'MAE': 'MAE'}

normalize = False

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
        #Normalize or not
        self.normalize_nodes(normalize)
        # Get non-dominated solutions:
        self.non_dominant_solutions(self.error)
        # Draw Front
        self.plot_pareto(self.error)

    def read_json_settings(self):
        "Read settings json"
        rmses, wmses, maeses = [], [], []
        disc_methods= []
        wass_1d, wass_multi = [], []
        for json_file in self.settings_json_files:   
            with open(self.model_path+json_file) as json_file:
                opened_data = json.load(json_file)
                if 'tb' not in distribution:
                    rmses.append(opened_data['RMSE']), wmses.append(opened_data['WRMSE']) , maeses.append(opened_data['MAE'])
                else: 
                    rmses.append(np.nan), wmses.append(np.nan), maeses.append(np.nan)
                wass_1d.append(opened_data['Wass1D']), wass_multi.append(opened_data['Wass_multi'])
                if opened_data['disc_method']!='MDLP':
                    disc_methods.append(opened_data['disc_method']+str(opened_data['bins']))
                else:
                    disc_methods.append(opened_data['disc_method'])
        self.error_frame = pd.DataFrame(data=np.transpose([disc_methods, rmses, wmses, maeses, wass_1d, wass_multi]), columns=['Disc_method','RMSE','MAE','WRMSE', 'Wass1D','Wass_multi']) 
        self.error_frame['RMSE'], self.error_frame['WRMSE'], self.error_frame['MAE'] = self.error_frame['RMSE'].astype(float), self.error_frame['WRMSE'].astype(float), self.error_frame['MAE'].astype(float)
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
                if (row[error]>row2[error]) & (row[self.y_axis]>row2[self.y_axis]):
                    drop_indices.append(index)
    
        self.non_dom_sol = self.non_dom_sol.drop(drop_indices)

    def normalize_nodes(self, normalize):
        if normalize==True:
            var_elimination_length = []
            for json_file in self.settings_json_files:   
                with open(self.model_path+json_file) as json_file: 
                    opened_data = json.load(json_file)   
                    var_elimination_length.append(opened_data['VE_complexity'])
            self.error_frame['VE_complexity'] = var_elimination_length
            self.error_frame['Relative Complexity'] = self.error_frame['Nodes']/self.error_frame['VE_complexity']
            self.y_axis = 'Relative Complexity'
        elif normalize==False:
            self.y_axis = 'Nodes' 


    def plot_pareto(self, error):
        "Plot data"
        sns.set(style='ticks', context='notebook', font_scale=1.1)
        fig, ax = plt.subplots()
        sns.scatterplot(y=self.y_axis, x=str(error), data=self.error_frame, legend=False, hue='Disc_method', ax=ax,
        palette=palettes, style="Method", size='load_time', sizes=(199,200)) #change when dd size is available
        ax.set(xlabel=errormap[self.error], ylabel='Nodes in Decision Diagram')
        if self.error == 'WRMSE' and 'lg' in distribution:
            ax.set(xlabel=r'WRMSE with respect to $\mathbb{E}[E\mid A]$', ylabel='Nodes in Decision Diagram')
        elif self.error == 'WRMSE' and 'nm' in distribution:
            ax.set(xlabel=r'WRMSE with respect to  $\mathbb{E}[B\mid A]$', ylabel='Nodes in Decision Diagram')
        else: 
            ax.set(xlabel=errormap[self.error], ylabel='Nodes in Decision Diagram')
        axe = sns.lineplot(data=self.non_dom_sol, x=str(error), y=self.y_axis,estimator='max', color='gainsboro')
        axe.lines[0].set_linestyle("--")
        plt.title('Experiment '+str(''.join(filter(str.isdigit, distribution))))
        print(self.error_frame)
        for i in range(self.error_frame.shape[0]):
            plt.text(y=self.error_frame[self.y_axis][i],x=self.error_frame[str(error)][i]+(self.error_frame[str(error)].max()*0.015),s=namemap[self.error_frame.Disc_method[i]], fontsize=11) #change when dd size is available
        if normalize==True:
            save_path = os.path.join(os.getcwd(), "plots/paretofront_"+args.distribution+"_"+error+"_normalized.png")
        elif normalize==False:
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
    if 'tb' in distribution:
        model_path = os.path.join(os.getcwd(), "models/tuebingen"+str(''.join(filter(str.isdigit, distribution)))  +"/")
    Pareto_Front = Pareto(model_path, error)
    Pareto_Front.create_plots()
