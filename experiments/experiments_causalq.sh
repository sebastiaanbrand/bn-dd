python scripts/generate_bn.py causalq

python scripts/discretize_bn.py causal_quadratic1 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py causal_quadratic1 MDLP 2 --target_variable Y  --CPT_method Bayes


# generate DDs from .cnf
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EB5 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EB8 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EB10
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EB12 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EB14 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EB17 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EB20
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EB25
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EB30 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EV5 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EV8 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EV10
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EV12 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EV14 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EV17 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EV20
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EV25
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_EV30 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayes/data_causal_quadratic_MDLP

python scripts/draw_pareto_front.py causal_quadratic1Bayes PE --CPT_method Bayes 
python scripts/draw_pareto_front.py causal_quadratic1Bayes Wass_multi --CPT_method Bayes  													
							
	
python scripts/generate_bn.py causalq

python scripts/discretize_bn.py causal_quadratic1 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py causal_quadratic1 MDLP 2 --target_variable Y  --CPT_method Bayespriors


# generate DDs from .cnf
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EB5 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EB8 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EB10
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EB12 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EB14 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EB17 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EB20
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EB25
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EB30 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EV5 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EV8 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EV10
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EV12 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EV14 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EV17 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EV20
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EV25
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_EV30 
./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_MDLP

python scripts/draw_pareto_front.py causal_quadratic1Bayespriors PE --CPT_method Bayespriors 
python scripts/draw_pareto_front.py causal_quadratic1Bayespriors Wass_scaled --CPT_method Bayespriors 
python scripts/draw_pareto_front.py causal_quadratic1Bayespriors Wass_multi --CPT_method Bayespriors 						
							
							
							
							
							
							
							
							



