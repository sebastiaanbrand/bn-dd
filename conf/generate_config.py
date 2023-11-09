from scipy.stats import qmc
from scipy.special import expit
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
samples_nm = np.array([sample_sizes_nm, binom_param_nm, sink_norm_params], dtype=object).T

#Tuebingen configurations
continuous_pairs= [3,21,25,26,43,48,68,76,79,84,85,88,91,95]
tb_edges = [('A', 'B')]
tb_source = tb_edges[0][0]
tb_sink = tb_edges[0][1]

#Total Sample sizes
total_sample_size = [y for x in [sample_sizes, samples_sobolt.T[0][0:25], sample_sizes_nm] for y in x]
total_sample_size = [round(x) for x in total_sample_size]


#Causal Bayesian Network Configuration
causal_edges = [('T', 'Y'), ('Z1', 'T'), ('Z1', 'Y')]
N = 1000
z = np.random.uniform(size=N)
t = np.random.binomial(1., p=1./(1. + np.exp(-5. * z)))
y = 5 + 2. * z + t + 0.1 * np.random.normal(size=N)
causal_df = pd.DataFrame({'Z1': z, 'T': t, 'Y': y})

#Synthetic Datasets
causal_edges_q = [('T', 'Y'), ('Z1', 'T'), ('Z1', 'Y')]
N, cov_dim = 2500, 1

#Quadratic DGP Configuration
z = 3 + np.random.normal(size=[N,cov_dim])
y0 = (0.1*np.sum(z, axis=1)+ np.random.normal(size=[N]))
y1 = y0**2 +0.2*np.sum(z, axis=1)+ np.random.normal(size=[N])
t = np.random.binomial(1,expit(np.sum(3 - z, axis=1)))
y = t*y1+(1-t)*y0
dgp_q = pd.DataFrame(z, columns=['Z1'])
dgp_q['Y']=y
dgp_q['T']=t
ate_q = np.mean([y1-y0])

#Synthetic Datasets
causal_edges_f = [('T', 'Y'), ('Z1', 'T'), ('Z1', 'Y'), ('Z2', 'T'), ('Z2', 'Y'), ('Z3', 'T'), ('Z3', 'Y'), ('Z4', 'T'), ('Z4', 'Y')
                , ('Z5', 'T'), ('Z5', 'Y')]
N, cov_dim = 2500, 5
#Friedman DGP Configuration
z = np.random.uniform(size=[N,cov_dim])
y0 = np.sin(np.pi*z.T[0]*z.T[1]) + 20*(z.T[2]-0.5)**2+10*z.T[3]+5*z.T[4] + np.random.normal(size=[N])
y1 = y0**2 + z.T[2]*np.cos(np.pi*z.T[0]*z.T[1])
t = np.random.binomial(1,expit(z.T[0]+z.T[1]-0.5))
y = t*y1+(1-t)*y0
dgp_f = pd.DataFrame(z, columns=['Z1','Z2','Z3','Z4','Z5'])
dgp_f['Y']=y
dgp_f['T']=t
ate_f = np.mean([y1-y0])

#Distribution Folders Folders:
dist_mapping = {'lg':'linear_gaussian','nm':'normal_mixture', 'tb':'tuebingen', 'lalonde':'lalonde','causal_friedman':'causal_friedman','causal_quadratic':'causal_quadratic'
                ,'causalpaper':'causalpaper', 'climategraph':'climategraph', 'aglietti':'aglietti', 'toy_aglietti':'toy_aglietti'}
sort_mapping = {'lg':'synthetic','nm':'synthetic', 'tb':'pair', 'lalonde':'causal','causal_friedman':'causal','causal_quadratic':'causal'}
source_mapping = {'lg':['A'],'nm':'X', 'tb':'A','lalonde':'treat','causal_friedman':'T','causal_quadratic':'T', 'causalpaper':["ECMWF_ERA5_LAND_MONTHLY_soil_temperature_level_1_sum_sum",
                                                                                                                               "NASA_FLDAS_NOAH01_C_GL_M_V001_Qle_tavg_max_std",
                                                                                                                               "NASA_GPM_L3_IMERG_MONTHLY_V06_precipitationQualityIndex_max_max"
                                                                                                                                        ],
                                                                                                                 'climategraph':["Cropland2000_mean_percent_s",
                                                                                                                                 "spi_1_f1_m"
                                                                                                                                        ],
                                                                                                                'aglietti':["U1","U2"],
                                                                                                                'toy_aglietti':["X"]}
sink_mapping = {'lg':'E','nm':'Y', 'tb':'B','lalonde':'re78','causal_friedman':'Y','causal_quadratic':'Y','causalpaper':'ACLED_fatalities_total', 'climategraph': 'acl_sum_evnt_m','aglietti':'Y'
                ,'toy_aglietti':'Y'}

lalonde_treated, lalonde_controls = "nswre74_treated.txt", "psid_controls.txt"
lalonde_cols =  ['treat', 'age', 'educ', 'black', 'hisp', 'married', 'nodegr','re74','re75', 're78']
lalonde_edges = [('treat', 're78'),('age', 'treat'), ('educ', 'treat'), ('black', 'treat'), ('hisp', 'treat'), ('married', 'treat'), ('nodegr', 'treat'), ('re74', 'treat'), ('re75', 'treat'),
            ('age', 're78'), ('educ', 're78'), ('black', 're78'), ('hisp', 're78'), ('married', 're78'), ('nodegr', 're78'), ('re74', 're78'), ('re75', 're78')]

namemap={'EB2': 'EW2',
         'EB3': 'EW3',
         'EB4': 'EW4',
         'EB5': 'EW5', 
         'EB6': 'EW6',
         'EB7': 'EW7',
         'EB8': 'EW8',
         'EB9': 'EW9',
        'EB10': 'EW10',
        'EB12': 'EW12',
        'EB14': 'EW14',
        'EB17': 'EW17',
        'EB18': 'EW18',
        'EB20': 'EW20',
        'EB25': 'EW25',
        'EB30': 'EW30',
        'EB35': 'EW35',
        'EB40': 'EW40',
        'EB50': 'EW50',
         'EV2': 'EF2',
         'EV3': 'EF3',
         'EV4': 'EF4',
         'EV5': 'EF5',
         'EV6': 'EF6',
         'EV7': 'EF7',
         'EV8': 'EF8', 
         'EV9': 'EF9',
        'EV10': 'EF10',
        'EV12': 'EF12',
        'EV14': 'EF14',
        'EV17': 'EF17',
        'EV18': 'EF18',
        'EV20': 'EF20',
        'EV25': 'EF25',
        'EV30': 'EF30',
        'EV35': 'EF35',
        'EV40': 'EF40',
        'EV50': 'EF50',
        'MDLP2': 'MDLP'}

errormap ={'Wass_multi': "Earth Mover's Distance",
           'Wass_scaled': "Scaled Earth Mover's Distance",
         'WRMSE': 'WRMSE',
        'RMSE': 'RMSE',
        'MAE': 'MAE',
        'PE': 'PE ate'}

errormap2 ={'Wass_multi': "EMD",
           'Wass_scaled': "Scaled Earth Mover's Distance",
         'WRMSE': 'WRMSE',
        'RMSE': 'RMSE',
        'MAE': 'MAE',
        'PE': 'PE ate'}

cpt_map ={'MLE': "MLE",
          'Bayes': "UP",
          'Bayespriors': "EBP"}

fullnamemap = {'EB':'Equal Bins','EV':'Equal Values','MD':'Minimum Discription Length'}

plot_map = {'lg':'Linear Gaussian','nm':'Normal Mixture', 'tb':'Tuebingen', 'lalonde':'Causal: Lalonde','causal_quadratic':'Causal: Quadratic DGP'}
plot_map2 = {'lg':'LG','nm':'NM', 'tb':'Tueb', 'lalonde':'Lalonde','causal_quadratic':'CQ DGP'}
plot_label = {'time_VE':'Variable Elimination Time (s)','time_BP':'Belief Propagation Time (s)',
              'total_load_time':'Total Load Time of the Decision Diagram (s)','build_time':'Build Time of the Decision Diagram (s)'
              ,'total_bdd_time':'Total Build and Inference Time on the Decision Diagram (s)'}

complex_vars_y, complex_vars_x =['time_VE','time_BP'], ['total_bdd_time']

dis_error_map = {'lg':['Wass_multi','WRMSE'],'nm':['Wass_multi','WRMSE'], 'tb':['Wass_multi'], 'lalonde':['Wass_multi','PE'],'causal_quadratic':['Wass_multi','PE']}