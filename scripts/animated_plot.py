import os
import argparse
from lgnpy import LinearGaussian
import numpy as np
import logging.config
import sys
import pandas as pd
import json
import seaborn as sns
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.animation as animation

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

normalize = False

class Pareto:
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
        self.settings_all = {}
        self.error = 'Wass_multi'
        self.error_frame = pd.DataFrame()

    def extract_data(self):
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
        # Get non-dominated solutions:
        self.non_dominant_solutions(self.error)
        # Draw Front
        return self.error_frame

    def read_json_settings(self):
        "Read settings json"
        rmses, wmses, maeses = [], [], []
        disc_methods= []
        wass_1d, wass_multi = [], []
        for json_file in self.settings_json_files:   
            with open(self.model_path+json_file) as json_file:
                opened_data = json.load(json_file)
                print(opened_data)
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
        self.y_axis = 'Nodes' 
        for index, row in self.error_frame.iterrows():
            for index2, row2 in self.error_frame.iterrows():
                if (row[error]>row2[error]) & (row[self.y_axis]>row2[self.y_axis]):
                    drop_indices.append(index)
    
        self.non_dom_sol = self.non_dom_sol.drop(drop_indices)
    






if __name__ == '__main__':
    args = parser.parse_args()
    distribution = args.distribution
    model_path7 = os.path.join(os.getcwd(), "models/linear_gaussian7/")
    model_path8 = os.path.join(os.getcwd(), "models/linear_gaussian8/")
    model_path9 = os.path.join(os.getcwd(), "models/linear_gaussian9/")
    model_path10 = os.path.join(os.getcwd(), "models/linear_gaussian10/")
    model_path11 = os.path.join(os.getcwd(), "models/linear_gaussian11/")
    model_path12 = os.path.join(os.getcwd(), "models/linear_gaussian12/")
    model_path13 = os.path.join(os.getcwd(), "models/linear_gaussian13/")
    model_path14 = os.path.join(os.getcwd(), "models/linear_gaussian14/")
    model_path15 = os.path.join(os.getcwd(), "models/linear_gaussian15/")
    model_path16 = os.path.join(os.getcwd(), "models/linear_gaussian16/")

    Pareto_Front = Pareto(model_path7)
    error_frame7 = Pareto_Front.extract_data()
    Pareto_Front = Pareto(model_path8)
    error_frame8 = Pareto_Front.extract_data()
    Pareto_Front = Pareto(model_path9)
    error_frame9 = Pareto_Front.extract_data()
    Pareto_Front = Pareto(model_path10)
    error_frame10 = Pareto_Front.extract_data()
    Pareto_Front = Pareto(model_path11)
    error_frame11 = Pareto_Front.extract_data()
    Pareto_Front = Pareto(model_path12)
    error_frame12 = Pareto_Front.extract_data()
    Pareto_Front = Pareto(model_path13)
    error_frame13 = Pareto_Front.extract_data()
    Pareto_Front = Pareto(model_path14)
    error_frame14 = Pareto_Front.extract_data()
    Pareto_Front = Pareto(model_path15)
    error_frame15 = Pareto_Front.extract_data()
    Pareto_Front = Pareto(model_path16)
    error_frame16 = Pareto_Front.extract_data()

erroframes=[error_frame7, error_frame8, error_frame9, error_frame10, error_frame11, error_frame12, error_frame13, error_frame14, error_frame15, error_frame16]

def animate(i):
    #sns.set(style='ticks', context='notebook', font_scale=1.2)
    #fig, ax = plt.subplots()
    #data = erroframes[i]
    sns.scatterplot(y='Nodes', x='Wass_multi', data=data, legend=False, hue='Disc_method', ax=ax,
                palette=palettes, style="Method", size='load_time', sizes=(199,200)) 
    #ax.set(xlabel=errormap['Wass_multi'], ylabel='Nodes in decision diagram')
    plt.title('Experiment1') 
    #for j in range(data.shape[0]):
    #    plt.text(y=data['Nodes'][j],x=data['Wass_multi'][j]+(data['Wass_multi'].max()*0.015),s=data.Disc_method[j], fontsize=11) #change when dd size is available

fig=plt.figure()
ani = matplotlib.animation.FuncAnimation(fig, animate, frames=len(erroframes),interval=700,repeat=True)
plt.show()
#sns.set(style='ticks', context='notebook', font_scale=1.2)
#fig, ax = plt.subplots()
#sns.scatterplot(y=self.y_axis, x=str(error), data=self.error_frame, legend=False, hue='Disc_method', ax=ax,
#palette=palettes, style="Method", size='load_time', sizes=(199,200)) #change when dd size is available
#ax.set(xlabel=errormap[self.error], ylabel='Nodes in decision diagram')
#axe = sns.lineplot(data=self.non_dom_sol, x=str(error), y=self.y_axis,estimator='max', color='gainsboro')
#axe.lines[0].set_linestyle("--")
#plt.title('Experiment '+str(''.join(filter(str.isdigit, distribution))))
#print(self.error_frame)
#for i in range(self.error_frame.shape[0]):
#    plt.text(y=self.error_frame[self.y_axis][i],x=self.error_frame[str(error)][i]+(self.error_frame[str(error)].max()*0.015),s=self.error_frame.Disc_method[i], fontsize=11) #change when dd size is available
