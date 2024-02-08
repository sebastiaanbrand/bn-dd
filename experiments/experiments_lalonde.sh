python scripts/generate_bn.py lalonde

# Discretize BNs
python scripts/discretize_bn.py lalonde1 EB 2 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 3 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 4 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 6 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 7 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 9 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 2 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 3 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 4 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 6 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 7 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 9 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 MDLP 2 --target_variable re78 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lalonde1 EV 10 --CPT_method Bayes


# generate DDs from .cnf
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB2
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB3 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB4 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB5 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB6 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB7
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB8 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB9 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB10
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EB12
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV2 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV3 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV4 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV5 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV6 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV7
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV8 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV9 
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV10
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_EV12
./dd_inference/build/analyze_bn models/lalonde1Bayes/data_lalonde_MDLP2

python scripts/draw_pareto_front.py lalonde1 PE --complexity==True --CPT_method Bayes
python scripts/draw_pareto_front.py lalonde1 Wass_multi --complexity==True --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lalonde1 EB 2 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 3 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 4 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 6 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 7 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 9 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 2 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 3 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 4 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 6 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 7 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 9 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 MDLP 2 --target_variable re78 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 12 --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB2
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB3 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB4 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB5 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB6 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB7
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB8 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB9 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB10
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV2 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV3 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV4 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV5 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV6 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV7
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV8 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV9 
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV10
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_MDLP
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EB12
./dd_inference/build/analyze_bn models/lalonde1Bayespriors/data_lalonde_EV12

python scripts/draw_pareto_front.py lalonde1Bayespriors PE --complexity==True --CPT_method Bayespriors
python scripts/draw_pareto_front.py lalonde1Bayespriors Wass_scaled --complexity==True --CPT_method Bayespriors
python scripts/draw_pareto_front.py lalonde1Bayespriors Wass_multi --complexity==True --CPT_method Bayespriors

# Lalonde ordered for BD
python scripts/discretize_bn.py lalonde1 EB 2 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 2 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 3 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 3 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 4 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 4 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 6 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 6 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 7 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 7 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 9 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 9 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 MDLP 2 --target_variable re78 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lalonde1 EV 12 --CPT_method Bayespriors