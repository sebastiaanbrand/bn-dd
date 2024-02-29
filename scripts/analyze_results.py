import os
import pandas as pd
import json
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
from pgmpy.models import BayesianNetwork
from pgmpy.inference import VariableElimination, BeliefPropagation, CausalInference
from pgmpy.readwrite import XMLBIFReader
from pgmpy.sampling import BayesianModelSampling
import matplotlib.ticker as mticker
import interpret.glassbox
import shap
import sys
sys.path.append('./')
pd.set_option('display.max_columns', None)
#import dd_inference as dd

#Paths and model to consider
path = os.path.join(os.getcwd(), "models/optimisation")
model = 'data_mixed_confounding2_EV30'
raw_data = model.rpartition('_')[0]

# Get raw data CSV and bin csv
raw_data = pd.read_csv(path+'/'+raw_data+'.csv')
bin_data = pd.read_csv(path+'/'+model+'.csv')

# Get xmlbif file if exist:
#reader = XMLBIFReader(path+'/'+model+".xmlbif")

#Get value dicts and settings
value_dict = pd.read_json(path+'/'+model+'_value_dict.json')

#Get settings
with open(path+'/'+model+'settings.json', 'rb') as f:
    res = json.load(f)
    settings = pd.json_normalize(res)

#Open cnf_vars for search var order
search_vars=[]
with open(f"{path+'/'+model}.cnf_rv_vars") as f:
            for line in f:
                name, *bins = line.strip().split()
                if name in settings.search_vars[0]:
                    print(name)
                    search_vars.append(name)
target_var = settings['target_var'][0][0]
if 'art' in model:
    target_var=int(target_var)
    search_vars=[int(search_var) for search_var in search_vars]
# List of json files to consider
json_list = []
for subdir, dirs, files in os.walk(path):
    if model in subdir and len(sorted([subdir +"/"+ json for json in os.listdir(subdir) if json.endswith('.json')]))>0:
        json_list.append(sorted([subdir +"/"+ json for json in os.listdir(subdir) if json.endswith('.json')])[0])


#Get files from json files
records = []
for json_file in json_list:
    with open(json_file, 'rb') as f:
        res = json.load(f)
        for scen in res['scenarios']:
            dim = scen['dimension']
            for run in scen['runs']:
                record = [res['algorithm']['name'], dim, run['instance'], run['evals'], run['best']['y'], run['best']['x']]
                records.append(record)
dt = pd.DataFrame.from_records(records, columns=['opt_algo','dim', 'instance', 'evals', 'y','x'])


# List of data files to consider
file_list = []
for subdir, dirs, files  in os.walk(path):
    if len(sorted([subdir +"/"+ file for file in os.listdir(subdir) if 'objective' in file and model in file and file.endswith('.csv')]))>0:
        file_list.append(sorted([subdir +"/"+ file for file in os.listdir(subdir) if 'objective' in file and model in file and file.endswith('.csv')]))

#Get detaild results from csv's
records = []
for file in file_list[0]:
    record = pd.read_csv(file)
    records.append(record)
det_res = pd.concat(records, ignore_index=True)


#Get intervention variables value and map bin values to float 
for i, col in enumerate(search_vars):
    dt[col] = dt['x'].apply(lambda x: x[i] if len(x) > i else None)
    dt[col] = dt[col].map(value_dict[col])

#Get expected value of intervention distribution function 
if settings['target'][0]=='max':
    dt[target_var] = value_dict[target_var].max() - dt['y']*np.abs(value_dict[target_var].max() - value_dict[target_var].min())
    det_res['E[y|do(t)]'] = (value_dict[target_var].max() - det_res['f(x)'])*np.abs(value_dict[target_var].max() - value_dict[target_var].min())
elif settings['target'][0]=='min':
    dt[target_var] = value_dict[target_var].min() + dt['y']*np.abs(value_dict[target_var].max() - value_dict[target_var].min())
    det_res['E[y|do(t)]'] = value_dict[target_var].min() + det_res['f(x)'] *np.abs(value_dict[target_var].max() - value_dict[target_var].min())

#Get the detailed results mean
det_res_mean = det_res[['ID','runtime', 'run','E[y|do(t)]']].groupby(['ID','runtime']).mean().reset_index()

# Filter the DataFrame to only include rows where 'target var' equals its group max
min_values = dt.groupby('opt_algo')[target_var].transform(min)
df_max = dt[dt[target_var] == min_values]
#Check if the intervened variables from BDD correspond to the intervened values from pgmpy results
#Use the same xmlbif files as in folder to prevent refitting (with possibly different method)
# model_struct = reader.get_model()
# infer = CausalInference(model_struct)
# infer2 = VariableElimination(model_struct)

#Get dictionairy of interventions to check for the do-operator of pgmpy
# intervention_values=[]
# for i in range(len(df_max)):
#     indices = [value_dict[value_dict[col]==df_max[col].iloc[i]].index[0] for col in df_max[search_vars].iloc[i].dropna().index]
#     index_tuples = list(zip(df_max[search_vars].iloc[i].dropna().index, indices))
#     intervention_values.append(dict(zip(df_max[search_vars].iloc[i].dropna().index,
#                                          [model_struct.states[key][index] for key, index in index_tuples])))

# target_var_values = [x for x in value_dict[target_var] if str(x) != 'nan']
#infer_result = infer.query(variables=[target_var], do=intervention_values[0]).values
#infer_result = infer2.query(variables=[target_var], evidence =intervention_values[-1]).values
# noemer = infer2.query(variables=['CIESIN_GPWv411_GPW_Population_Density_population_density_max', 
#                                  'spam2010v2r0_global_prod_P_RICE_I_min', 
#                                  'NASA_GPM_L3_IMERG_MONTHLY_V06_precipitationQualityIndex_max_max',
#                                  target_var]).values[7][4][17]
# deler = infer2.query(variables=['CIESIN_GPWv411_GPW_Population_Density_population_density_max', 
#                                  'spam2010v2r0_global_prod_P_RICE_I_min', 
#                                  'NASA_GPM_L3_IMERG_MONTHLY_V06_precipitationQualityIndex_max_max',]).values[7][4][17]
# deler = infer2.query(variables=['CIESIN_GPWv411_GPW_Population_Density_population_density_max', 
#                                  'spam2010v2r0_global_prod_P_RICE_I_min', 
#                                  'NASA_GPM_L3_IMERG_MONTHLY_V06_precipitationQualityIndex_max_max',]).values[7][4][17]


# print(noemer, deler)
# print(sum((noemer/deler)*target_var_values))
# print(infer_result)
# print(target_var_values)
# print(df_max)
#print(f'Expected value pgmpy: {sum(infer_result*target_var_values)}')
#print(f'Minimum of target value: {min(target_var_values)}')
# sys.exit()
#print(sum(infer_result*target_var_values)-min(target_var_values))
# infer2 = VariableElimination(model_struct)

# noemer = infer2.query(variables=['X', 'Z', 'Y']).values[11][87]
# deler = infer2.query(variables=['X', 'Z']).values[11][87]
# print(infer2.query(variables=['X', 'Z', 'Y']).values[11][87])
# print(infer2.query(variables=['X', 'Z']).values[11][87])
# print(noemer/deler)
# print(value_dict[target_var].min())
#infer_result2 = infer.query(variables=[target_var], do=intervention_values[-1]).values

#print(infer2.query(variables=['X', 'Z', 'Y']).values[1][8][0])
#print(infer2.query(variables=['X', 'Z']).values[1][8])



# Figure size
plt.rcParams['figure.figsize'] = (8, 5.5)
sns.set(style='ticks', context='notebook', font_scale=1.1)


# #Plot Results in terms of distribution
# for i, col in enumerate(search_vars+[target_var]):
#     print(col, df_max)
#     x_value_to_highlight = df_max[col].iloc[0]  # Replace with the x-value you want to highlight
#     print(col, raw_data[col].mean() , x_value_to_highlight)
#     # Create a Seaborn displot
#     g = sns.displot(data=raw_data, x=col, height=5, aspect=2)
#     #g.fig.suptitle('Distribution and Intervention Value', fontsize=13, fontweight="bold")
    
#     # Add a vertical line to the plot
#     plt.axvline(x=x_value_to_highlight, color='red', linestyle='--')
    
#     # Customize axes labels
#     g.set_axis_labels(x_var=col, y_var='Density', fontsize=14, fontweight="bold")
    
#     # Adjust layout
#     plt.tight_layout()

#     # Save Plot
#     save_path = os.path.join(path + '/figs/' + 'dist' + model + col + '.png')
#     plt.savefig(save_path)
#     plt.close(g.fig)  # Close the figure to avoid display issues in the loop

# #Plot Results in terms of function
# for i, col in enumerate(search_vars):
#     x_value_to_highlight = df_max[target_var].iloc[0]  # Replace with the x-value you want to highlight
#     # Create a Seaborn scatterplot
#     g = sns.scatterplot(data=raw_data, x=col, y=target_var)
    
#     # Set the title for the plot
#     #g.set_title(f'Distribution of ' r'$\mathbb{E}$'+f'[{target_var}|do({col})] and optimal value' , fontsize=13, fontweight="bold")
    
#     search_var_coord = df_max[col].iloc[0]
#     target_var_coord = df_max[target_var].iloc[0]

#     # Add a vertical line to the plot
#     plt.plot(search_var_coord, target_var_coord, 'rx', markersize=15, markeredgewidth=2)
#     # Customize axes labels
#     #g.set(xlabel=col, ylabel=r'$\mathbb{E}$'+f'[{target_var}|do({col})]')
#     g.set(xlabel=col, ylabel=r'$\mathbb{E}[Y|$'+f'do({col}={col.lower()})]')
#     g.set_xlabel(xlabel= col.lower(), fontsize = 14)
#     g.set_ylabel(ylabel=r'$\mathbb{E}[Y|$'+f'do({col}={col.lower()})]', fontsize = 14)

#     # Adjust layout
#     plt.tight_layout()

#     # Save Plot
#     save_path = os.path.join(path, 'figs', model + col + '.png')
#     plt.savefig(save_path)
#     plt.close()  # Close the figure to avoid display issues in the loop


# Create a Seaborn scatterplot
g = sns.lineplot(data=det_res_mean, x='runtime', y='E[y|do(t)]', hue='ID')

if det_res_mean['E[y|do(t)]'].mean()>0:
    g.set(xlabel='Evaluations', ylabel=r'$\mathbb{E}[Y|do(X_s=x_s)]$')
    g.set_xlabel(xlabel='Evaluations', fontsize = 14)
    g.set_ylabel(ylabel=r'$\mathbb{E}[Y|do(X_s=x_s)]$', fontsize = 14, fontweight="bold")
    ticks = sorted([0, 0.5,1,1.5,2,2.5,3,3.5])
    g.set_yticks(ticks)
    ticks2 = sorted([0, 250,500,750,1000,1250,1500,1750,2000])
    g.set_ylim(0, 3.5)
    g.set_xlim(0, 2000)
    g.grid(True)
    g.set_xticks(ticks2)
    g.get_yaxis().set_major_formatter(mticker.ScalarFormatter())
else: 
    print('hi')
    g.set(xlabel='Evaluations', ylabel=r'$\mathbb{E}[Y|do(X_s=x_s)]$')
    g.set_xlabel(xlabel='Evaluations', fontsize = 14)
    g.set_ylabel(ylabel=r'$\mathbb{E}[Y|do(X_s=x_s)])$', fontsize = 14, fontweight="bold")    

# Adjust layout
plt.tight_layout()

# Save Plot
save_path = os.path.join(path, 'figs', model + 'opt' + '.png')
plt.savefig(save_path)
plt.close()  # Close the figure to avoid display issues in the loop

#Plot Shapley Data

# dt.rename(columns={"CIESIN_GPWv411_GPW_Population_Density_population_density_max":"Population \n Density",
#                    "spam2010v2r0_global_prod_P_RICE_I_min":"Rice \n Production",
#                    "NASA_GPM_L3_IMERG_MONTHLY_V06_precipitationQualityIndex_max_max":"Precipitation",
                   
#                    }, inplace=True)

# X100 = shap.utils.sample(dt[["Population \n Density",
#                   "Rice \n Production",
#                   "Precipitation"]], 1000)

# model_ebm = interpret.glassbox.ExplainableBoostingRegressor(interactions=0)
# model_ebm.fit(dt[["Population \n Density",
#                   "Rice \n Production",
#                   "Precipitation"]], dt['ACLED_fatalities_total'])
# explainer = shap.Explainer(model_ebm.predict, X100)
# shap_values = explainer(dt[["Population \n Density",
#                   "Rice \n Production",
#                   "Precipitation"]])
# #shap.plots.beeswarm(shap_values.abs, color="shap_red")


# shap.plots.bar(shap_values)
# plt.gcf().set_size_inches(11,5)
# #plt.subplots_adjust(left=0.2, right=0.8, top=0.9, bottom=0.1)
# # Save Plot
# save_path = os.path.join(path, 'figs', model + 'shapley' + '.png')
# plt.savefig(save_path)
# plt.close()  # Close the figure to avoid display issues in the loop