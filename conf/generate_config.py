from scipy.stats import qmc
import numpy as np
import pandas as pd

#General configs
randomseed= 45

# General LP configurations
lg_edges = [('A', 'D'), ('B', 'D'), ('D', 'E'), ('C', 'E')]
lin_params = [(2, 3), (3, 3)]

#LG Sample size configurations
experiment_count_size = 9
[mean_A, mean_B, mean_C] = [20, 20, 15]
[var_A, var_B, var_C, var_D, var_E] = [2, 2, 2, 2 , 2]
sample_sizes = [5000,3000,2000,1000,800,600,500,400,300,200,100]
samples_sizes = np.array([np.array(sample_sizes),var_A*np.ones_like(sample_sizes)]).T

#LG Sobolt Sequences configurations
experiment_count_sobolt = 101
sampler = qmc.Sobol(d=2, scramble=False)
sample = sampler.random_base2(m=5)
l_bounds = [100, 1] #sample size, variance
u_bounds = [2000, 10]
samples_sobolt = qmc.scale(sample, l_bounds, u_bounds)    

#Normal Mixture configurations
nm_edges = [('X', 'Y')]
nm_source = nm_edges[0][0]
nm_sink = nm_edges[0][1]

#Experiment, configurations
sample_sizes_nm = [500,500,500,500,100,100,100,100]
binom_param_nm = [0.5,0.8,0.5,0.8,0.5,0.8,0.5,0.8]
sink_norm_params = [[(21, 10), (25, 1)],[(21, 10), (25, 1)], [(6, 2), (4, 2)], [(6, 2), (4, 2)],
                     [(21, 10), (25, 1)], [(21, 10), (25, 1)], [(6, 2), (4, 2)], [(6, 2), (4, 2)]]
samples_nm = np.array([sample_sizes_nm, binom_param_nm, sink_norm_params]).T

#Tuebingen configurations
continuous_pairs= [3,21,25,26,43,48,68,76,79,84,85,88,91,95]
tb_edges = [('A', 'B')]
tb_source = tb_edges[0][0]
tb_sink = tb_edges[0][1]

#Causal Bayesian Network Configuration
causal_edges = [('T', 'Y'), ('Z', 'T'), ('Z', 'Y')]
N = 10000
z = np.random.uniform(size=N)
t = np.random.binomial(1., p=1./(1. + np.exp(-5. * z)))
y = 2. * z + t + 0.1 * np.random.normal(size=N)
df = pd.DataFrame({'Z': z, 'T': t, 'Y': y})

#Distribution Folders Folders:
dist_mapping = {'lg':'linear_gaussian','nm':'normal_mixture', 'tb':'tuebingen'}
source_mapping = {'lg':'A','nm':'X', 'tb':'A'}
sink_mapping = {'lg':'E','nm':'Y', 'tb':'B'}