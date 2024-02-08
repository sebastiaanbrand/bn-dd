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
                ,'causalpaper':'causalpaper', 'climategraph':'climategraph', 'aglietti':'aglietti', 'toy_aglietti':'toy_aglietti', 'mixed_confounding':'mixed_confounding'
                , 'mehra':'mehra', 'arth':'arth', 'do': 'do_test'}
sort_mapping = {'lg':'synthetic','nm':'synthetic', 'tb':'pair', 'lalonde':'causal','causal_friedman':'causal','causal_quadratic':'causal',
                'do_test': 'do_test'}
source_mapping = {'lg':['A'],'nm':'X', 'tb':'A','lalonde':'treat','causal_friedman':'T','causal_quadratic':'T', 'causalpaper':["ECMWF_ERA5_LAND_MONTHLY_soil_temperature_level_1_sum_sum",
                                                                                                                               "NASA_FLDAS_NOAH01_C_GL_M_V001_Qle_tavg_max_std",
                                                                                                                               "NASA_GPM_L3_IMERG_MONTHLY_V06_precipitationQualityIndex_max_max"
                                                                                                                                        ],
                                                                                                                 'climategraph':["Cropland2000_mean_percent_s",
                                                                                                                                 "spi_1_f1_m"
                                                                                                                                        ],
                                                                                                                'aglietti':["U1","U2"],
                                                                                                                'toy_aglietti':["X"],
                                                                                                                'mixed_confounding':["X2", "X3", "X4","X5", "X6","X7","X8"],
                                                                                                                'arth': ['81', '100', '414', '422', '519', '738', '783'],
                                                                                                                'mehra': ['Region', 'Zone', 'Type', 'Year', 'Season', 'Month', 'Day', 'Hour', 'Latitude', 'Longitude', 'Altitude'],
                                                                                                                'do_test': 'Z'}
sink_mapping = {'lg':'E','nm':'Y', 'tb':'B','lalonde':'re78','causal_friedman':'Y','causal_quadratic':'Y','causalpaper':'ACLED_fatalities_total', 'climategraph': 'acl_sum_evnt_m','aglietti':'Y'
                ,'toy_aglietti':'Y', 'mixed_confounding':["X9","X10","X11"], 'arth': ['4', '8', '13', '26', '38', '78', '93', '96', '101', '126', '135', '144', '155', '161', '181', '187', '197', '211', '219', '226', '234', '245', '248', '256', '269', '281', '296', '299', '328', '342', '360', '363', '368', '377', '378', '412', '454', '460', '464', '480', '496', '537', '540', '547', '554', '565', '576', '596', '598', '622', '623', '636', '640', '651', '661', '665', '666', '677', '686', '712', '736', '739', '758', '767', '778', '786', '798'],
                'mehra': ['tp', 'CVD60', 'pm2.5'],'do_test': 'Y'}


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

mehra_edges = [('Region', 'wd'), ('Region', 'blh'), ('Region', 'CVD60'), ('Region', 'pm2.5'), ('Zone', 'no2'), ('Zone', 'o3'), ('Zone', 'so2'), ('Zone', 'co'), ('Zone', 'pm10'), ('Type', 'no2'), ('Type', 'o3'), ('Type', 'so2'), ('Type', 'co'), ('Type', 'pm10'), ('Type', 'pm2.5'), ('Year', 't2m'), ('Year', 'ws'), ('Year', 'wd'), ('Year', 'tp'), ('Year', 'CVD60'), ('Year', 'no2'), ('Year', 'o3'), ('Year', 'so2'), ('Year', 'co'), ('Year', 'pm10'), ('Year', 'pm2.5'), ('Season', 'CVD60'), ('Month', 't2m'), ('Month', 'ws'), ('Month', 'wd'), ('Month', 'tp'), ('Month', 'blh'), ('Month', 'CVD60'), ('Day', 'ws'), ('Day', 'wd'), ('Hour', 't2m'), ('Hour', 'tp'), ('Hour', 'blh'), ('Hour', 'ssr'), ('Latitude', 't2m'), ('Latitude', 'ws'), ('Latitude', 'ssr'), ('Longitude', 'ws'), ('Longitude', 'blh'), ('Longitude', 'ssr'), ('Altitude', 'ssr'), ('Altitude', 'no2'), ('t2m', 'ws'), ('t2m', 'blh'), ('t2m', 'ssr'), ('t2m', 'wd'), ('ws', 'tp'), ('ws', 'blh'), ('ws', 'ssr'), ('ws', 'wd'), ('wd', 'blh'), ('wd', 'ssr'), ('tp', 'ssr'), ('blh', 'ssr'), ('blh', 'no2'), ('blh', 'o3'), ('ssr', 'no2'), ('ssr', 'o3'), ('ssr', 'so2'), ('ssr', 'co'), ('ssr', 'pm10'), ('no2', 'o3'), ('no2', 'co'), ('no2', 'pm10'), ('so2', 'co'), ('pm10', 'pm2.5')]
arth_edges = [('4', '539'), ('8', '209'), ('13', '331'), ('13', '422'), ('20', '573'), ('20', '781'), ('26', '781'), ('38', '570'), ('47', '331'), ('47', '479'), ('47', '714'), ('47', '736'), ('47', '414'), ('47', '422'), ('47', '452'), ('47', '629'), ('47', '793'), ('61', '111'), ('61', '480'), ('61', '81'), ('61', '570'), ('63', '444'), ('63', '198'), ('63', '738'), ('78', '726'), ('81', '108'), ('81', '111'), ('81', '144'), ('81', '198'), ('81', '211'), ('81', '248'), ('81', '368'), ('81', '377'), ('81', '570'), ('81', '622'), ('81', '636'), ('81', '665'), ('81', '666'), ('81', '712'), ('81', '767'), ('81', '793'), ('86', '181'), ('86', '738'), ('93', '539'), ('96', '558'), ('100', '245'), ('100', '296'), ('100', '412'), ('101', '443'), ('108', '272'), ('108', '603'), ('111', '496'), ('111', '537'), ('111', '570'), ('126', '558'), ('126', '783'), ('135', '570'), ('155', '679'), ('161', '558'), ('181', '783'), ('187', '783'), ('197', '539'), ('198', '686'), ('198', '779'), ('209', '738'), ('219', '570'), ('226', '573'), ('234', '570'), ('256', '558'), ('256', '570'), ('269', '558'), ('269', '783'), ('272', '289'), ('272', '560'), ('272', '414'), ('272', '452'), ('272', '603'), ('272', '726'), ('281', '627'), ('289', '786'), ('289', '414'), ('289', '452'), ('289', '726'), ('299', '444'), ('328', '519'), ('331', '714'), ('331', '414'), ('331', '422'), ('331', '452'), ('331', '479'), ('342', '558'), ('360', '539'), ('363', '558'), ('378', '570'), ('414', '452'), ('414', '726'), ('414', '786'), ('422', '479'), ('422', '570'), ('422', '627'), ('422', '629'), ('422', '714'), ('422', '736'), ('443', '565'), ('443', '573'), ('443', '600'), ('444', '738'), ('452', '714'), ('452', '603'), ('452', '726'), ('454', '783'), ('460', '570'), ('464', '570'), ('479', '677'), ('479', '714'), ('479', '629'), ('479', '793'), ('480', '738'), ('539', '596'), ('539', '758'), ('539', '778'), ('539', '585'), ('540', '738'), ('547', '783'), ('554', '570'), ('558', '739'), ('558', '783'), ('560', '793'), ('560', '627'), ('560', '726'), ('570', '576'), ('570', '585'), ('570', '598'), ('570', '623'), ('570', '651'), ('570', '699'), ('570', '767'), ('600', '699'), ('603', '781'), ('627', '661'), ('627', '738'), ('629', '714'), ('629', '793'), ('636', '738'), ('640', '783'), ('677', '714'), ('679', '783'), ('726', '786'), ('779', '798'), ('781', '783')]