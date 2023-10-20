# Discretize BNs
python scripts/discretize_bn.py nm1 EB 5 2>&1 
python scripts/discretize_bn.py nm1 EB 8 2>&1 
python scripts/discretize_bn.py nm1 EB 10 2>&1 
python scripts/discretize_bn.py nm1 EB 12 2>&1 
python scripts/discretize_bn.py nm1 EB 14 2>&1 
python scripts/discretize_bn.py nm1 EB 17 2>&1 
python scripts/discretize_bn.py nm1 EB 20 2>&1 
python scripts/discretize_bn.py nm1 EB 25 2>&1 
python scripts/discretize_bn.py nm1 EB 30 2>&1 
python scripts/discretize_bn.py nm1 EV 5 2>&1 
python scripts/discretize_bn.py nm1 EV 8 2>&1 
python scripts/discretize_bn.py nm1 EV 10 2>&1 
python scripts/discretize_bn.py nm1 EV 12 2>&1 
python scripts/discretize_bn.py nm1 EV 14 2>&1 
python scripts/discretize_bn.py nm1 EV 17 2>&1 
python scripts/discretize_bn.py nm1 EV 20 2>&1 
python scripts/discretize_bn.py nm1 EV 25 2>&1 
python scripts/discretize_bn.py nm1 EV 30 2>&1 
python scripts/discretize_bn.py nm1 MDLP 2 --target_variable Y 2>&1 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture1MLE/data_nm_MDLP 

python scripts/draw_pareto_front.py nm1MLE WRMSE
python scripts/draw_pareto_front.py nm1MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py nm2 EB 5 2>&1 
python scripts/discretize_bn.py nm2 EB 8 2>&1 
python scripts/discretize_bn.py nm2 EB 10 2>&1 
python scripts/discretize_bn.py nm2 EB 12 2>&1 
python scripts/discretize_bn.py nm2 EB 14 2>&1 
python scripts/discretize_bn.py nm2 EB 17 2>&1 
python scripts/discretize_bn.py nm2 EB 20 2>&1 
python scripts/discretize_bn.py nm2 EB 25 2>&1 
python scripts/discretize_bn.py nm2 EB 30 2>&1 
python scripts/discretize_bn.py nm2 EV 5 2>&1 
python scripts/discretize_bn.py nm2 EV 8 2>&1 
python scripts/discretize_bn.py nm2 EV 10 2>&1 
python scripts/discretize_bn.py nm2 EV 12 2>&1 
python scripts/discretize_bn.py nm2 EV 14 2>&1 
python scripts/discretize_bn.py nm2 EV 17 2>&1 
python scripts/discretize_bn.py nm2 EV 20 2>&1 
python scripts/discretize_bn.py nm2 EV 25 2>&1 
python scripts/discretize_bn.py nm2 EV 30 2>&1 
python scripts/discretize_bn.py nm2 MDLP 2 --target_variable Y 2>&1 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture2MLE/data_nm_MDLP 

python scripts/draw_pareto_front.py nm2MLE WRMSE
python scripts/draw_pareto_front.py nm2MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py nm3 EB 5 2>&1 
python scripts/discretize_bn.py nm3 EB 8 2>&1 
python scripts/discretize_bn.py nm3 EB 10 2>&1 
python scripts/discretize_bn.py nm3 EB 12 2>&1 
python scripts/discretize_bn.py nm3 EB 14 2>&1 
python scripts/discretize_bn.py nm3 EB 17 2>&1 
python scripts/discretize_bn.py nm3 EB 20 2>&1 
python scripts/discretize_bn.py nm3 EB 25 2>&1 
python scripts/discretize_bn.py nm3 EB 30 2>&1 
python scripts/discretize_bn.py nm3 EV 5 2>&1 
python scripts/discretize_bn.py nm3 EV 8 2>&1 
python scripts/discretize_bn.py nm3 EV 10 2>&1 
python scripts/discretize_bn.py nm3 EV 12 2>&1 
python scripts/discretize_bn.py nm3 EV 14 2>&1 
python scripts/discretize_bn.py nm3 EV 17 2>&1 
python scripts/discretize_bn.py nm3 EV 20 2>&1 
python scripts/discretize_bn.py nm3 EV 25 2>&1 
python scripts/discretize_bn.py nm3 EV 30 2>&1 
python scripts/discretize_bn.py nm3 MDLP 2 --target_variable Y 2>&1 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture3MLE/data_nm_MDLP 

python scripts/draw_pareto_front.py nm3MLE WRMSE
python scripts/draw_pareto_front.py nm3MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py nm4 EB 5 2>&1 
python scripts/discretize_bn.py nm4 EB 8 2>&1 
python scripts/discretize_bn.py nm4 EB 10 2>&1 
python scripts/discretize_bn.py nm4 EB 12 2>&1 
python scripts/discretize_bn.py nm4 EB 14 2>&1 
python scripts/discretize_bn.py nm4 EB 17 2>&1 
python scripts/discretize_bn.py nm4 EB 20 2>&1 
python scripts/discretize_bn.py nm4 EB 25 2>&1 
python scripts/discretize_bn.py nm4 EB 30 2>&1 
python scripts/discretize_bn.py nm4 EV 5 2>&1 
python scripts/discretize_bn.py nm4 EV 8 2>&1 
python scripts/discretize_bn.py nm4 EV 10 2>&1 
python scripts/discretize_bn.py nm4 EV 12 2>&1 
python scripts/discretize_bn.py nm4 EV 14 2>&1 
python scripts/discretize_bn.py nm4 EV 17 2>&1 
python scripts/discretize_bn.py nm4 EV 20 2>&1 
python scripts/discretize_bn.py nm4 EV 25 2>&1 
python scripts/discretize_bn.py nm4 EV 30 2>&1 
python scripts/discretize_bn.py nm4 MDLP 2 --target_variable Y 2>&1 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture4MLE/data_nm_MDLP 

python scripts/draw_pareto_front.py nm4MLE WRMSE
python scripts/draw_pareto_front.py nm4MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py nm5 EB 5 2>&1 
python scripts/discretize_bn.py nm5 EB 8 2>&1 
python scripts/discretize_bn.py nm5 EB 10 2>&1 
python scripts/discretize_bn.py nm5 EB 12 2>&1 
python scripts/discretize_bn.py nm5 EB 14 2>&1 
python scripts/discretize_bn.py nm5 EB 17 2>&1 
python scripts/discretize_bn.py nm5 EB 20 2>&1 
python scripts/discretize_bn.py nm5 EB 25 2>&1 
python scripts/discretize_bn.py nm5 EB 30 2>&1 
python scripts/discretize_bn.py nm5 EV 5 2>&1 
python scripts/discretize_bn.py nm5 EV 8 2>&1 
python scripts/discretize_bn.py nm5 EV 10 2>&1 
python scripts/discretize_bn.py nm5 EV 12 2>&1 
python scripts/discretize_bn.py nm5 EV 14 2>&1 
python scripts/discretize_bn.py nm5 EV 17 2>&1 
python scripts/discretize_bn.py nm5 EV 20 2>&1 
python scripts/discretize_bn.py nm5 EV 25 2>&1 
python scripts/discretize_bn.py nm5 EV 30 2>&1 
python scripts/discretize_bn.py nm5 MDLP 2 --target_variable Y 2>&1 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture5MLE/data_nm_MDLP 

python scripts/draw_pareto_front.py nm5MLE WRMSE
python scripts/draw_pareto_front.py nm5MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py nm6 EB 5 2>&1 
python scripts/discretize_bn.py nm6 EB 8 2>&1 
python scripts/discretize_bn.py nm6 EB 10 2>&1 
python scripts/discretize_bn.py nm6 EB 12 2>&1 
python scripts/discretize_bn.py nm6 EB 14 2>&1 
python scripts/discretize_bn.py nm6 EB 17 2>&1 
python scripts/discretize_bn.py nm6 EB 20 2>&1 
python scripts/discretize_bn.py nm6 EB 25 2>&1 
python scripts/discretize_bn.py nm6 EB 30 2>&1 
python scripts/discretize_bn.py nm6 EV 5 2>&1 
python scripts/discretize_bn.py nm6 EV 8 2>&1 
python scripts/discretize_bn.py nm6 EV 10 2>&1 
python scripts/discretize_bn.py nm6 EV 12 2>&1 
python scripts/discretize_bn.py nm6 EV 14 2>&1 
python scripts/discretize_bn.py nm6 EV 17 2>&1 
python scripts/discretize_bn.py nm6 EV 20 2>&1 
python scripts/discretize_bn.py nm6 EV 25 2>&1 
python scripts/discretize_bn.py nm6 EV 30 2>&1 
python scripts/discretize_bn.py nm6 MDLP 2 --target_variable Y 2>&1 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture6MLE/data_nm_MDLP 

python scripts/draw_pareto_front.py nm6MLE WRMSE
python scripts/draw_pareto_front.py nm6MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py nm7 EB 5 2>&1 
python scripts/discretize_bn.py nm7 EB 8 2>&1 
python scripts/discretize_bn.py nm7 EB 10 2>&1 
python scripts/discretize_bn.py nm7 EB 12 2>&1 
python scripts/discretize_bn.py nm7 EB 14 2>&1 
python scripts/discretize_bn.py nm7 EB 17 2>&1 
python scripts/discretize_bn.py nm7 EB 20 2>&1 
python scripts/discretize_bn.py nm7 EB 25 2>&1 
python scripts/discretize_bn.py nm7 EB 30 2>&1 
python scripts/discretize_bn.py nm7 EV 5 2>&1 
python scripts/discretize_bn.py nm7 EV 8 2>&1 
python scripts/discretize_bn.py nm7 EV 10 2>&1 
python scripts/discretize_bn.py nm7 EV 12 2>&1 
python scripts/discretize_bn.py nm7 EV 14 2>&1 
python scripts/discretize_bn.py nm7 EV 17 2>&1 
python scripts/discretize_bn.py nm7 EV 20 2>&1 
python scripts/discretize_bn.py nm7 EV 25 2>&1 
python scripts/discretize_bn.py nm7 EV 30 2>&1 
python scripts/discretize_bn.py nm7 MDLP 2 --target_variable Y 2>&1 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture7MLE/data_nm_MDLP 

python scripts/draw_pareto_front.py nm7MLE WRMSE
python scripts/draw_pareto_front.py nm7MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py nm8 EB 5 2>&1 
python scripts/discretize_bn.py nm8 EB 8 2>&1 
python scripts/discretize_bn.py nm8 EB 10 2>&1 
python scripts/discretize_bn.py nm8 EB 12 2>&1 
python scripts/discretize_bn.py nm8 EB 14 2>&1 
python scripts/discretize_bn.py nm8 EB 17 2>&1 
python scripts/discretize_bn.py nm8 EB 20 2>&1 
python scripts/discretize_bn.py nm8 EB 25 2>&1 
python scripts/discretize_bn.py nm8 EB 30 2>&1 
python scripts/discretize_bn.py nm8 EV 5 2>&1 
python scripts/discretize_bn.py nm8 EV 8 2>&1 
python scripts/discretize_bn.py nm8 EV 10 2>&1 
python scripts/discretize_bn.py nm8 EV 12 2>&1 
python scripts/discretize_bn.py nm8 EV 14 2>&1 
python scripts/discretize_bn.py nm8 EV 17 2>&1 
python scripts/discretize_bn.py nm8 EV 20 2>&1 
python scripts/discretize_bn.py nm8 EV 25 2>&1 
python scripts/discretize_bn.py nm8 EV 30 2>&1 
python scripts/discretize_bn.py nm8 MDLP 2 --target_variable Y 2>&1 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture8MLE/data_nm_MDLP 

python scripts/draw_pareto_front.py nm8MLE WRMSE
python scripts/draw_pareto_front.py nm8MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py nm1 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py nm1 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py nm1 MDLP 2 --target_variable Y --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture1Bayes/data_nm_MDLP 

python scripts/draw_pareto_front.py nm1Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py nm1Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py nm2 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py nm2 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py nm2 MDLP 2 --target_variable Y --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture2Bayes/data_nm_MDLP 

python scripts/draw_pareto_front.py nm2Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py nm2Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py nm3 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py nm3 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py nm3 MDLP 2 --target_variable Y --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture3Bayes/data_nm_MDLP 

python scripts/draw_pareto_front.py nm3Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py nm3Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py nm4 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py nm4 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py nm4 MDLP 2 --target_variable Y --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture4Bayes/data_nm_MDLP 

python scripts/draw_pareto_front.py nm4Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py nm4Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py nm5 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py nm5 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py nm5 MDLP 2 --target_variable Y --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture5Bayes/data_nm_MDLP 

python scripts/draw_pareto_front.py nm5Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py nm5Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py nm6 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py nm6 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py nm6 MDLP 2 --target_variable Y --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture6Bayes/data_nm_MDLP 

python scripts/draw_pareto_front.py nm6Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py nm6Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py nm7 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py nm7 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py nm7 MDLP 2 --target_variable Y --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture7Bayes/data_nm_MDLP 

python scripts/draw_pareto_front.py nm7Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py nm7Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py nm8 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py nm8 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py nm8 MDLP 2 --target_variable Y --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture8Bayes/data_nm_MDLP 

python scripts/draw_pareto_front.py nm8Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py nm8Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py nm1 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm1 MDLP 2 --target_variable Y --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture1Bayespriors/data_nm_MDLP 

python scripts/draw_pareto_front.py nm1Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py nm1Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py nm2 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm2 MDLP 2 --target_variable Y --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture2Bayespriors/data_nm_MDLP 

python scripts/draw_pareto_front.py nm2Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py nm2Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py nm3 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm3 MDLP 2 --target_variable Y --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture3Bayespriors/data_nm_MDLP 

python scripts/draw_pareto_front.py nm3Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py nm3Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py nm4 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm4 MDLP 2 --target_variable Y --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture4Bayespriors/data_nm_MDLP 

python scripts/draw_pareto_front.py nm4Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py nm4Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py nm5 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm5 MDLP 2 --target_variable Y --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture5Bayespriors/data_nm_MDLP 

python scripts/draw_pareto_front.py nm5Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py nm5Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py nm6 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm6 MDLP 2 --target_variable Y --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture6Bayespriors/data_nm_MDLP 

python scripts/draw_pareto_front.py nm6Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py nm6Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py nm7 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm7 MDLP 2 --target_variable Y --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture7Bayespriors/data_nm_MDLP 

python scripts/draw_pareto_front.py nm7Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py nm7Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py nm8 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py nm8 MDLP 2 --target_variable Y --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EB10 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EB12 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EB14 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EB5 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EB8 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EB17 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EB20 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EB25 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EB30 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EV10 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EV12 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EV14 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EV5 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EV8 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EV17 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EV20 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EV25 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_EV30 
./dd_inference/build/analyze_bn models/normal_mixture8Bayespriors/data_nm_MDLP 

python scripts/draw_pareto_front.py nm8Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py nm8Bayespriors Wass_multi --CPT_method Bayespriors