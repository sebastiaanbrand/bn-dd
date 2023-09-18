import os
import argparse
import numpy as np
import logging.config
import sys
import pandas as pd
import itertools
import json
import seaborn as sns
import matplotlib.pyplot as plt
sys.path.insert(1,os.path.join(os.getcwd(), "conf/"))
import generate_config as config



# Change default plot size
plt.rcParams['figure.figsize'] = (8, 5.5)
sns.set(style='ticks', context='notebook', font_scale=1.1)
parser = argparse.ArgumentParser(description='Draw Pareto Front')
parser.add_argument('distribution', type=str, help='Sort of distribution to consider')
parser.add_argument('error', type=str, help='Error to draw in paretofront')
parser.add_argument('--CPT_method', type=str, choices=['MLE','Bayes', 'Bayespriors'], help='method to infer CPT, default=MLE', default='MLE')
parser.add_argument('--complexity', type=bool, choices=[True, False], help='Plot complexity plots', default=False)
parser.add_argument('--alternative', type=bool, choices=[True, False], help='Plot alternative Paretofront', default=False)

def sortby(x):
    try:
        return int(x[1].split(' ')[0])
    except ValueError:
        return float('inf')

class Pareto:
    """Creating Pareto-front"""
    def __init__(self, model_path, error, complexity=False):
            # Create logger
        log_format = '%(asctime)s - %(name)s - %(levelname)s - %(funcName)s - %(message)s'
        logging.basicConfig(format=log_format, level=logging.INFO, stream=sys.stdout)
        self.logger = logging.getLogger(__name__)
        self.model_path = model_path
        self.settings_json_files = sorted([pos_json for pos_json in os.listdir(model_path) if pos_json.endswith('settings.json')])
        self.ddinfo_json_files = sorted([pos_json for pos_json in os.listdir(model_path) if pos_json.endswith('ddinfo.json')])
        #print(self.settings_json_files.sort(key=sortby))
        #print(self.ddinfo_json_files.sort(key=sortby))

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
        #s Save relevant ;abels
        self.get_pareto_labels()
        # Draw Pareto fronts
        self.plot_pareto(self.error)
        # Draw complexity plots
        if complexity==True:
            self.complex_plots()
        if alternative==True:
            self.plot_alternative_pareto(self.error)

    def read_json_settings(self):
        "Read settings json"
        json_files = [pd.json_normalize(json.load(open(self.model_path+json_file))) for json_file in self.settings_json_files]
        self.error_frame = pd.concat(json_files).reset_index(drop=True)

    def read_json_info(self):
        "Read info json"
        json_files = [pd.json_normalize(json.load(open(self.model_path+json_file))) for json_file in self.ddinfo_json_files]
        self.time_frame = pd.concat(json_files).reset_index(drop=True)
        self.error_frame = pd.concat([self.error_frame, self.time_frame], axis=1)
    
    def preprocess_data(self):
        "map data"
        self.error_frame['disc_method'] = self.error_frame['disc_method']+self.error_frame['bins'].map(str)
        self.error_frame['method'] = self.error_frame['disc_method'].str[:2].map(config.fullnamemap)
        self.distribution = self.error_frame['distribution'][0]
        if not self.error_frame.target_column.isnull().values.all():
            self.target_col = self.error_frame[self.error_frame['method']=='Minimum Discription Length']['target_column'].values[0]
        else: 
            self.target_col = ''
        self.CPT_method = self.error_frame.CPT_method[0]
        self.error_frame['total_bdd_time'] = self.error_frame['total_load_time'] + self.error_frame['wmc_time']
        print(self.error_frame[['nodecount','bins','disc_method']])

    def non_dominant_solutions(self, error):
        self.non_dom_sol = self.error_frame.copy()
        drop_indices=[]
        for index, row in self.error_frame.iterrows():
            for index2, row2 in self.error_frame.iterrows():
                if (row[error]>row2[error]) & (row['nodecount']>row2['nodecount']):
                    drop_indices.append(index)
    
        self.non_dom_sol = self.non_dom_sol.drop(drop_indices)

    def get_pareto_labels(self):
        #Axis labels
        if self.error in ['WRMSE','MAE','RMSE'] and self.error_frame['distribution'][0] in ['lg','nm']:
            self.xlabel=f'{self.error} with respect '+r'to $\mathbb{E}$'+f'[{self.target_col}|A]'
        else: 
           self.xlabel=config.errormap[self.error]
        self.ylabel='Nodes in Decision Diagram'

        if self.distribution in ['lg','tb','nm']:
            exp_string = ' experiment ' +str(''.join(filter(str.isdigit, distribution)))
        else:
            exp_string = ''
        #Plotting Title
        self.pareto_title = config.plot_map[self.distribution]+exp_string +' for CPT method '+ self.CPT_method
        self.complex_title = 'Complexity Plot for '+ config.plot_map[self.distribution]+exp_string +' for CPT method '+ self.CPT_method
        self.error_frame.sort_values(by=['bins'], inplace=True)

    def plot_pareto(self, error):
        "Plot data via multiple plots"
        fig, ax = plt.subplots()
        #First Plot: create Scatterplots
        print(self.error_frame)
        sns.scatterplot(y='nodecount', x=str(error), data=self.error_frame[self.error_frame.method=='Equal Bins'], legend=False, ax=ax, hue='disc_method',
        palette=sns.color_palette("Blues_d",n_colors=len(self.error_frame[self.error_frame.method=='Equal Bins']), desat=1), size='wmc_time', sizes=(199,200)) #change when dd size is available
        sns.scatterplot(y='nodecount', x=str(error), data=self.error_frame[self.error_frame.method=='Equal Values'], legend=False, ax=ax, hue='disc_method',
        palette=sns.color_palette("Reds_d", n_colors=len(self.error_frame[self.error_frame.method=='Equal Values']), desat=1), size='wmc_time', sizes=(199,200),
        style='method', markers={'Equal Values':'X'}) #change when dd size is available
        sns.scatterplot(y='nodecount', x=str(error), data=self.error_frame[self.error_frame.method=='Minimum Discription Length'], legend=False, ax=ax, hue='disc_method',
        palette=sns.color_palette("Greens_d", n_colors=len(self.error_frame[self.error_frame.method=='Minimum Discription Length'])), size='wmc_time', sizes=(199,200),
        style='method', markers={'Minimum Discription Length':'s'}) #change when dd size is available
        ax.set_xlabel(xlabel=self.xlabel, fontsize = 11, fontweight="bold")
        ax.set_ylabel(ylabel='Nodes in Decision Diagram', fontsize = 11, fontweight="bold")
        plt.title(self.pareto_title, fontsize = 11, fontweight="bold")
        #Second Plot: Paretoline
        axe = sns.lineplot(data=self.non_dom_sol, x=str(error), y='nodecount',estimator='max', color='dimgrey')
        axe.lines[0].set_linestyle("--")
        plt.grid()
        #Third plot: Labels of the Dots
        for i in range(self.error_frame.shape[0]):
            plt.text(y=self.error_frame['nodecount'][i],x=self.error_frame[str(error)][i]+
                (self.error_frame[str(error)].max()*0.015),s=config.namemap[self.error_frame.disc_method[i]], fontsize=11)
        #Save Plot     
        save_path = os.path.join(os.getcwd(), "plots/paretofront_"+args.distribution+"_"+error+".png")
    
        plt.savefig(save_path)

    def plot_alternative_pareto(self, error):
        "Plot data via multiple plots"
        fig, ax = plt.subplots()
        #First Plot: create Scatterplots
        print(self.error_frame)
        sns.scatterplot(y='total_bdd_time', x=str(error), data=self.error_frame[self.error_frame.method=='Equal Bins'], legend=False, ax=ax, hue='disc_method',
        palette=sns.color_palette("Blues_d",n_colors=len(self.error_frame[self.error_frame.method=='Equal Bins']), desat=1), size='wmc_time', sizes=(199,200)) #change when dd size is available
        sns.scatterplot(y='total_bdd_time', x=str(error), data=self.error_frame[self.error_frame.method=='Equal Values'], legend=False, ax=ax, hue='disc_method',
        palette=sns.color_palette("Reds_d", n_colors=len(self.error_frame[self.error_frame.method=='Equal Values']), desat=1), size='wmc_time', sizes=(199,200),
        style='method', markers={'Equal Values':'X'}) #change when dd size is available
        sns.scatterplot(y='total_bdd_time', x=str(error), data=self.error_frame[self.error_frame.method=='Minimum Discription Length'], legend=False, ax=ax, hue='disc_method',
        palette=sns.color_palette("Greens_d", n_colors=len(self.error_frame[self.error_frame.method=='Minimum Discription Length'])), size='wmc_time', sizes=(199,200),
        style='method', markers={'Minimum Discription Length':'s'}) #change when dd size is available
        ax.set_xlabel(xlabel=self.xlabel, fontsize = 11, fontweight="bold")
        ax.set_ylabel(ylabel='Total inference time of BDD', fontsize = 11, fontweight="bold")
        plt.title(self.pareto_title, fontsize = 11, fontweight="bold")
        #Second Plot: Paretoline
        axe = sns.lineplot(data=self.non_dom_sol, x=str(error), y='total_bdd_time',estimator='max', color='dimgrey')
        axe.lines[0].set_linestyle("--")
        plt.grid()
        #Third plot: Labels of the Dots
        for i in range(self.error_frame.shape[0]):
            plt.text(y=self.error_frame['total_bdd_time'][i],x=self.error_frame[str(error)][i]+
                (self.error_frame[str(error)].max()*0.015),s=config.namemap[self.error_frame.disc_method[i]], fontsize=11)
        #Save Plot     
        save_path = os.path.join(os.getcwd(), "plots/paretofront_alternative_"+args.distribution+"_"+error+".png")
    
        plt.savefig(save_path)


    def complex_plots(self):
        "Complexity Plots for all complexity comparison combinations"
        complex_combinations = [element for element in itertools.product(config.complex_vars_y, config.complex_vars_x)]
        for j, combination in enumerate(complex_combinations):
            plt.clf()
            self.error_frame[f'{combination[0]}/{combination[1]}']=self.error_frame[combination[0]]/self.error_frame[combination[1]]
            print(self.error_frame[f'{combination[0]}/{combination[1]}'])
            fig, ax = plt.subplots()
            plt.title(self.complex_title, fontsize = 13, fontweight="bold")
            ax.set(yscale="log")
            ax.set_xlabel(xlabel='Number of Bins', fontsize = 11, fontweight="bold")
            ax.set_ylabel(ylabel=f'{config.plot_label[combination[0]]} / \n {config.plot_label[combination[1]]}', fontsize = 11, fontweight="bold")
            #First plot: First Scatterplot
            sns.scatterplot(y=f'{combination[0]}/{combination[1]}', x='bins', data=self.error_frame[self.error_frame.method=='Equal Bins'], legend=False, 
                            ax=ax, hue='disc_method', palette=sns.color_palette("Blues_d",n_colors=len(self.error_frame[self.error_frame.method=='Equal Bins']), desat=1), 
                            size='wmc_time', sizes=(199,200), style='method', markers={'Equal Bins':"o"}) #change when dd size is available
            sns.scatterplot(y=f'{combination[0]}/{combination[1]}', x='bins', data=self.error_frame[self.error_frame.method=='Equal Values'], legend=False, 
                            ax=ax, hue='disc_method', palette=sns.color_palette("Reds_d", n_colors=len(self.error_frame[self.error_frame.method=='Equal Values']), desat=1),
                              size='wmc_time', sizes=(199,200), style='method', markers={'Equal Values':'X'}) 
            sns.scatterplot(y=f'{combination[0]}/{combination[1]}', x='bins', data=self.error_frame[self.error_frame.method=='Minimum Discription Length'], legend=False, 
                            ax=ax, hue='disc_method', palette=sns.color_palette("Greens_d", n_colors=len(self.error_frame[self.error_frame.method=='Minimum Discription Length'])),
                            size='wmc_time', sizes=(199,200), style='method', markers={'Minimum Discription Length':'s'}) #change when dd size is available
            #Second plot: Labels of the Dots
            for i in range(self.error_frame.shape[0]):
                plt.text(y=self.error_frame[f'{combination[0]}/{combination[1]}'][i],x=self.error_frame['bins'][i]+
                    (self.error_frame['bins'].max()*0.015),s=config.namemap[self.error_frame.disc_method[i]], fontsize=11)
            #Save Plot    
            save_path = os.path.join(os.getcwd(), "plots/complex_plot_"+args.distribution+"_"+str(j)+".png")
            plt.savefig(save_path)    


if __name__ == '__main__':
    args = parser.parse_args()
    distribution = args.distribution
    error = args.error
    complexity = args.complexity
    cpt_fit_method = args.CPT_method
    alternative = args.alternative
    if 'lg' in distribution:
        model_path = os.path.join(os.getcwd(), "models/linear_gaussian"+str(''.join(filter(str.isdigit, distribution)))+str(cpt_fit_method)+"/")
    if 'nm' in distribution:
        model_path = os.path.join(os.getcwd(), "models/normal_mixture"+str(''.join(filter(str.isdigit, distribution)))+str(cpt_fit_method)+"/")
    if 'tb' in distribution:
        model_path = os.path.join(os.getcwd(), "models/tuebingen"+str(''.join(filter(str.isdigit, distribution)))+str(cpt_fit_method)+"/")
    if 'causal' in distribution:
        model_path = os.path.join(os.getcwd(), "models/causal_quadratic"+str(''.join(filter(str.isdigit, distribution)))+str(cpt_fit_method)+"/")
    if 'lalonde' in distribution:
        model_path = os.path.join(os.getcwd(), "models/lalonde"+str(''.join(filter(str.isdigit, distribution)))+str(cpt_fit_method)+"/")
    Pareto_Front = Pareto(model_path, error, complexity)
    Pareto_Front.create_plots()

