# Discretize BNs
python scripts/discretize_bn.py lg9 EB 5 
python scripts/discretize_bn.py lg9 EB 8 
python scripts/discretize_bn.py lg9 EB 10 
python scripts/discretize_bn.py lg9 EB 12 
python scripts/discretize_bn.py lg9 EB 14 
python scripts/discretize_bn.py lg9 EB 17 
python scripts/discretize_bn.py lg9 EB 20 
python scripts/discretize_bn.py lg9 EB 25 
python scripts/discretize_bn.py lg9 EB 30 
python scripts/discretize_bn.py lg9 EV 5 
python scripts/discretize_bn.py lg9 EV 8 
python scripts/discretize_bn.py lg9 EV 10 
python scripts/discretize_bn.py lg9 EV 12 
python scripts/discretize_bn.py lg9 EV 14 
python scripts/discretize_bn.py lg9 EV 17 
python scripts/discretize_bn.py lg9 EV 20 
python scripts/discretize_bn.py lg9 EV 25 
python scripts/discretize_bn.py lg9 EV 30 
python scripts/discretize_bn.py lg9 MDLP 2 --target_variable E 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EB5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EB8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EB10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EB12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EB14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EB17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EB20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EB25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EB30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EV5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EV8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EV10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EV12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EV14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EV17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EV20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EV25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_EV30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9MLE/data_lg_MDLP 2>&1 

python scripts/draw_pareto_front.py lg9MLE WRMSE
python scripts/draw_pareto_front.py lg9MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg10 EB 5 
python scripts/discretize_bn.py lg10 EB 8 
python scripts/discretize_bn.py lg10 EB 10 
python scripts/discretize_bn.py lg10 EB 12 
python scripts/discretize_bn.py lg10 EB 14 
python scripts/discretize_bn.py lg10 EB 17 
python scripts/discretize_bn.py lg10 EB 20 
python scripts/discretize_bn.py lg10 EB 25 
python scripts/discretize_bn.py lg10 EB 30 
python scripts/discretize_bn.py lg10 EV 5 
python scripts/discretize_bn.py lg10 EV 8 
python scripts/discretize_bn.py lg10 EV 10 
python scripts/discretize_bn.py lg10 EV 12 
python scripts/discretize_bn.py lg10 EV 14 
python scripts/discretize_bn.py lg10 EV 17 
python scripts/discretize_bn.py lg10 EV 20 
python scripts/discretize_bn.py lg10 EV 25 
python scripts/discretize_bn.py lg10 EV 30 
python scripts/discretize_bn.py lg10 MDLP 2 --target_variable E 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EB5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EB8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EB10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EB12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EB14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EB17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EB20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EB25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EB30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EV5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EV8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EV10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EV12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EV14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EV17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EV20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EV25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_EV30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10MLE/data_lg_MDLP 2>&1 

python scripts/draw_pareto_front.py lg10MLE WRMSE
python scripts/draw_pareto_front.py lg10MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg11 EB 5 
python scripts/discretize_bn.py lg11 EB 8 
python scripts/discretize_bn.py lg11 EB 10 
python scripts/discretize_bn.py lg11 EB 12 
python scripts/discretize_bn.py lg11 EB 14 
python scripts/discretize_bn.py lg11 EB 17 
python scripts/discretize_bn.py lg11 EB 20 
python scripts/discretize_bn.py lg11 EB 25 
python scripts/discretize_bn.py lg11 EB 30 
python scripts/discretize_bn.py lg11 EV 5 
python scripts/discretize_bn.py lg11 EV 8 
python scripts/discretize_bn.py lg11 EV 10 
python scripts/discretize_bn.py lg11 EV 12 
python scripts/discretize_bn.py lg11 EV 14 
python scripts/discretize_bn.py lg11 EV 17 
python scripts/discretize_bn.py lg11 EV 20 
python scripts/discretize_bn.py lg11 EV 25 
python scripts/discretize_bn.py lg11 EV 30 
python scripts/discretize_bn.py lg11 MDLP 2 --target_variable E 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EB5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EB8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EB10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EB12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EB14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EB17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EB20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EB25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EB30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EV5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EV8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EV10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EV12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EV14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EV17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EV20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EV25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_EV30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11MLE/data_lg_MDLP 2>&1 

python scripts/draw_pareto_front.py lg11MLE WRMSE
python scripts/draw_pareto_front.py lg11MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg12 EB 5 
python scripts/discretize_bn.py lg12 EB 8 
python scripts/discretize_bn.py lg12 EB 10 
python scripts/discretize_bn.py lg12 EB 12 
python scripts/discretize_bn.py lg12 EB 14 
python scripts/discretize_bn.py lg12 EB 17 
python scripts/discretize_bn.py lg12 EB 20 
python scripts/discretize_bn.py lg12 EB 25 
python scripts/discretize_bn.py lg12 EB 30 
python scripts/discretize_bn.py lg12 EV 5 
python scripts/discretize_bn.py lg12 EV 8 
python scripts/discretize_bn.py lg12 EV 10 
python scripts/discretize_bn.py lg12 EV 12 
python scripts/discretize_bn.py lg12 EV 14 
python scripts/discretize_bn.py lg12 EV 17 
python scripts/discretize_bn.py lg12 EV 20 
python scripts/discretize_bn.py lg12 EV 25 
python scripts/discretize_bn.py lg12 EV 30 
python scripts/discretize_bn.py lg12 MDLP 2 --target_variable E 

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EB5 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EB8 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EB10 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EB12 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EB14 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EB17 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EB20 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EB25 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EB30 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EV5 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EV8 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EV10 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EV12 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EV14 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EV17 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EV20 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EV25 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_EV30 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301260216.txt

python scripts/draw_pareto_front.py lg12MLE WRMSE
python scripts/draw_pareto_front.py lg12MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg13 EB 5 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EB 8 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EB 10 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EB 12 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EB 14 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EB 17 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EB 20 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EB 25 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EB 30 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EV 5 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EV 8 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EV 10 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EV 12 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EV 14 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EV 17 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EV 20 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EV 25 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 EV 30 2>&1 | tee -a experiments/log_20230302145136.txt
python scripts/discretize_bn.py lg13 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_20230302145136.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EB5 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EB8 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EB10 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EB12 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EB14 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EB17 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EB20 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EB25 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EB30 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EV5 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EV8 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EV10 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EV12 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EV14 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EV17 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EV20 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EV25 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_EV30 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301360216.txt

python scripts/draw_pareto_front.py lg13MLE WRMSE
python scripts/draw_pareto_front.py lg13MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg14 EB 5 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EB 8 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EB 10 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EB 12 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EB 14 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EB 17 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EB 20 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EB 25 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EB 30 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EV 5 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EV 8 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EV 10 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EV 12 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EV 14 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EV 17 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EV 20 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EV 25 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 EV 30 2>&1 | tee -a experiments/log_20230302145146.txt
python scripts/discretize_bn.py lg14 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_20230302145146.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EB5 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EB8 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EB10 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EB12 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EB14 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EB17 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EB20 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EB25 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EB30 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EV5 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EV8 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EV10 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EV12 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EV14 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EV17 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EV20 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EV25 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_EV30 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301460216.txt

python scripts/draw_pareto_front.py lg14MLE WRMSE
python scripts/draw_pareto_front.py lg14MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg15 EB 5 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EB 8 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EB 10 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EB 12 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EB 14 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EB 17 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EB 20 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EB 25 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EB 30 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EV 5 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EV 8 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EV 10 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EV 12 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EV 14 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EV 17 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EV 20 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EV 25 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 EV 30 2>&1 | tee -a experiments/log_20230302145156.txt
python scripts/discretize_bn.py lg15 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_20230302145156.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EB5 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EB8 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EB10 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EB12 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EB14 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EB17 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EB20 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EB25 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EB30 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EV5 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EV8 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EV10 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EV12 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EV14 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EV17 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EV20 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EV25 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_EV30 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301560216.txt

python scripts/draw_pareto_front.py lg15MLE WRMSE
python scripts/draw_pareto_front.py lg15MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg16 EB 5 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EB 8 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EB 10 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EB 12 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EB 14 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EB 17 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EB 20 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EB 25 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EB 30 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EV 5 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EV 8 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EV 10 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EV 12 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EV 14 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EV 17 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EV 20 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EV 25 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 EV 30 2>&1 | tee -a experiments/log_20230302145166.txt
python scripts/discretize_bn.py lg16 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_20230302145166.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EB5 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EB8 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EB10 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EB12 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EB14 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EB17 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EB20 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EB25 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EB30 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EV5 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EV8 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EV10 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EV12 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EV14 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EV17 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EV20 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EV25 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_EV30 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301660216.txt

python scripts/draw_pareto_front.py lg16MLE WRMSE
python scripts/draw_pareto_front.py lg16MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg17 EB 5 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EB 8 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EB 10 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EB 12 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EB 14 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EB 17 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EB 20 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EB 25 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EB 30 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EV 5 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EV 8 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EV 10 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EV 12 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EV 14 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EV 17 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EV 20 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EV 25 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 EV 30 2>&1 | tee -a experiments/log_20230302145176.txt
python scripts/discretize_bn.py lg17 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_20230302145176.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EB5 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EB8 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EB10 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EB12 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EB14 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EB17 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EB20 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EB25 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EB30 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EV5 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EV8 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EV10 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EV12 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EV14 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EV17 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EV20 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EV25 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_EV30 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301760216.txt

python scripts/draw_pareto_front.py lg17MLE WRMSE
python scripts/draw_pareto_front.py lg17MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg18 EB 5 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EB 8 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EB 10 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EB 12 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EB 14 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EB 17 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EB 20 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EB 25 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EB 30 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EV 5 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EV 8 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EV 10 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EV 12 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EV 14 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EV 17 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EV 20 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EV 25 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 EV 30 2>&1 | tee -a experiments/log_20230302145186.txt
python scripts/discretize_bn.py lg18 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_20230302145186.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EB5 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EB8 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EB10 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EB12 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EB14 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EB17 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EB20 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EB25 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EB30 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV5 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV8 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV10 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV12 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV14 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV17 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV20 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV25 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV30 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301860216.txt

python scripts/draw_pareto_front.py lg18MLE WRMSE
python scripts/draw_pareto_front.py lg18MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg19 EB 5 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EB 8 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EB 10 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EB 12 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EB 14 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EB 17 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EB 20 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EB 25 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EB 30 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EV 5 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EV 8 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EV 10 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EV 12 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EV 14 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EV 17 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EV 20 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EV 25 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 EV 30 2>&1 | tee -a experiments/log_20230302145196.txt
python scripts/discretize_bn.py lg19 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_20230302145196.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EB5 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EB8 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EB10 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EB12 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EB14 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EB17 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EB20 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EB25 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EB30 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EV5 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EV8 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EV10 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EV12 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EV14 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EV17 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EV20 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EV25 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_EV30 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301960216.txt

python scripts/draw_pareto_front.py lg19MLE WRMSE
python scripts/draw_pareto_front.py lg19MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg101 EB 5 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EB 8 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EB 10 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EB 12 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EB 14 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EB 17 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EB 20 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EB 25 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EB 30 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EV 5 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EV 8 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EV 10 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EV 12 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EV 14 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EV 17 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EV 20 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EV 25 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 EV 30 2>&1 | tee -a experiments/log_202303021451016.txt
python scripts/discretize_bn.py lg101 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451016.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010160216.txt

python scripts/draw_pareto_front.py lg101MLE WRMSE
python scripts/draw_pareto_front.py lg101MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg102 EB 5 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EB 8 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EB 10 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EB 12 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EB 14 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EB 17 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EB 20 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EB 25 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EB 30 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EV 5 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EV 8 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EV 10 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EV 12 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EV 14 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EV 17 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EV 20 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EV 25 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 EV 30 2>&1 | tee -a experiments/log_202303021451026.txt
python scripts/discretize_bn.py lg102 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451026.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010260216.txt

python scripts/draw_pareto_front.py lg102MLE WRMSE
python scripts/draw_pareto_front.py lg102MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg103 EB 5 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EB 8 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EB 10 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EB 12 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EB 14 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EB 17 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EB 20 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EB 25 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EB 30 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EV 5 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EV 8 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EV 10 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EV 12 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EV 14 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EV 17 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EV 20 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EV 25 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 EV 30 2>&1 | tee -a experiments/log_202303021451036.txt
python scripts/discretize_bn.py lg103 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451036.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010360216.txt

python scripts/draw_pareto_front.py lg103MLE WRMSE
python scripts/draw_pareto_front.py lg103MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg104 EB 5 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EB 8 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EB 10 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EB 12 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EB 14 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EB 17 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EB 20 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EB 25 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EB 30 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EV 5 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EV 8 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EV 10 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EV 12 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EV 14 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EV 17 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EV 20 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EV 25 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 EV 30 2>&1 | tee -a experiments/log_202303021451046.txt
python scripts/discretize_bn.py lg104 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451046.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010460216.txt

python scripts/draw_pareto_front.py lg104MLE WRMSE
python scripts/draw_pareto_front.py lg104MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg105 EB 5 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EB 8 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EB 10 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EB 12 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EB 14 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EB 17 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EB 20 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EB 25 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EB 30 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EV 5 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EV 8 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EV 10 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EV 12 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EV 14 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EV 17 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EV 20 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EV 25 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 EV 30 2>&1 | tee -a experiments/log_202303021451056.txt
python scripts/discretize_bn.py lg105 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451056.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010560216.txt

python scripts/draw_pareto_front.py lg105MLE WRMSE
python scripts/draw_pareto_front.py lg105MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg106 EB 5 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EB 8 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EB 10 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EB 12 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EB 14 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EB 17 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EB 20 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EB 25 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EB 30 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EV 5 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EV 8 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EV 10 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EV 12 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EV 14 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EV 17 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EV 20 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EV 25 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 EV 30 2>&1 | tee -a experiments/log_202303021451066.txt
python scripts/discretize_bn.py lg106 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451066.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010660216.txt

python scripts/draw_pareto_front.py lg106MLE WRMSE
python scripts/draw_pareto_front.py lg106MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg107 EB 5 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EB 8 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EB 10 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EB 12 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EB 14 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EB 17 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EB 20 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EB 25 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EB 30 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EV 5 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EV 8 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EV 10 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EV 12 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EV 14 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EV 17 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EV 20 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EV 25 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 EV 30 2>&1 | tee -a experiments/log_202303021451076.txt
python scripts/discretize_bn.py lg107 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451076.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010760216.txt

python scripts/draw_pareto_front.py lg107MLE WRMSE
python scripts/draw_pareto_front.py lg107MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg108 EB 5 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EB 8 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EB 10 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EB 12 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EB 14 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EB 17 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EB 20 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EB 25 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EB 30 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EV 5 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EV 8 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EV 10 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EV 12 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EV 14 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EV 17 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EV 20 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EV 25 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 EV 30 2>&1 | tee -a experiments/log_202303021451086.txt
python scripts/discretize_bn.py lg108 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451086.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010860216.txt

python scripts/draw_pareto_front.py lg108MLE WRMSE
python scripts/draw_pareto_front.py lg108MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg109 EB 5 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EB 8 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EB 10 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EB 12 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EB 14 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EB 17 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EB 20 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EB 25 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EB 30 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EV 5 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EV 8 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EV 10 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EV 12 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EV 14 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EV 17 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EV 20 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EV 25 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 EV 30 2>&1 | tee -a experiments/log_202303021451096.txt
python scripts/discretize_bn.py lg109 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451096.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010960216.txt

python scripts/draw_pareto_front.py lg109MLE WRMSE
python scripts/draw_pareto_front.py lg109MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg110 EB 5 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EB 8 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EB 10 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EB 12 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EB 14 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EB 17 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EB 20 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EB 25 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EB 30 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EV 5 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EV 8 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EV 10 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EV 12 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EV 14 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EV 17 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EV 20 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EV 25 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 EV 30 2>&1 | tee -a experiments/log_202303021451106.txt
python scripts/discretize_bn.py lg110 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451106.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011060216.txt

python scripts/draw_pareto_front.py lg110MLE WRMSE
python scripts/draw_pareto_front.py lg110MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg111 EB 5 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EB 8 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EB 10 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EB 12 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EB 14 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EB 17 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EB 20 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EB 25 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EB 30 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EV 5 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EV 8 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EV 10 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EV 12 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EV 14 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EV 17 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EV 20 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EV 25 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 EV 30 2>&1 | tee -a experiments/log_202303021451116.txt
python scripts/discretize_bn.py lg111 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451116.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EB122>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011160216.txt

python scripts/draw_pareto_front.py lg111MLE WRMSE
python scripts/draw_pareto_front.py lg111MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg112 EB 5 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EB 8 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EB 10 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EB 12 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EB 14 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EB 17 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EB 20 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EB 25 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EB 30 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EV 5 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EV 8 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EV 10 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EV 12 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EV 14 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EV 17 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EV 20 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EV 25 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 EV 30 2>&1 | tee -a experiments/log_202303021451126.txt
python scripts/discretize_bn.py lg112 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451126.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011260216.txt

python scripts/draw_pareto_front.py lg112MLE WRMSE
python scripts/draw_pareto_front.py lg112MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg113 EB 5 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EB 8 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EB 10 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EB 12 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EB 14 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EB 17 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EB 20 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EB 25 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EB 30 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EV 5 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EV 8 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EV 10 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EV 12 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EV 14 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EV 17 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EV 20 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EV 25 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 EV 30 2>&1 | tee -a experiments/log_202303021451136.txt
python scripts/discretize_bn.py lg113 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451136.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011360216.txt

python scripts/draw_pareto_front.py lg113MLE WRMSE
python scripts/draw_pareto_front.py lg113MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg114 EB 5 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EB 8 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EB 10 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EB 12 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EB 14 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EB 17 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EB 20 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EB 25 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EB 30 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EV 5 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EV 8 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EV 10 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EV 12 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EV 14 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EV 17 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EV 20 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EV 25 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 EV 30 2>&1 | tee -a experiments/log_202303021451146.txt
python scripts/discretize_bn.py lg114 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451146.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011460216.txt

python scripts/draw_pareto_front.py lg114MLE WRMSE
python scripts/draw_pareto_front.py lg114MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg115 EB 5 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EB 8 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EB 10 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EB 12 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EB 14 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EB 17 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EB 20 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EB 25 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EB 30 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EV 5 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EV 8 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EV 10 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EV 12 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EV 14 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EV 17 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EV 20 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EV 25 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 EV 30 2>&1 | tee -a experiments/log_202303021451156.txt
python scripts/discretize_bn.py lg115 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451156.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011560216.txt

python scripts/draw_pareto_front.py lg115MLE WRMSE
python scripts/draw_pareto_front.py lg115MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg116 EB 5 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EB 8 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EB 10 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EB 12 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EB 14 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EB 17 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EB 20 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EB 25 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EB 30 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EV 5 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EV 8 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EV 10 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EV 12 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EV 14 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EV 17 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EV 20 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EV 25 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 EV 30 2>&1 | tee -a experiments/log_202303021451166.txt
python scripts/discretize_bn.py lg116 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451166.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011660216.txt

python scripts/draw_pareto_front.py lg116MLE WRMSE
python scripts/draw_pareto_front.py lg116MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg117 EB 5 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EB 8 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EB 10 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EB 12 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EB 14 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EB 17 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EB 20 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EB 25 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EB 30 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EV 5 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EV 8 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EV 10 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EV 12 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EV 14 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EV 17 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EV 20 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EV 25 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 EV 30 2>&1 | tee -a experiments/log_202303021451176.txt
python scripts/discretize_bn.py lg117 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451176.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011760216.txt

python scripts/draw_pareto_front.py lg117MLE WRMSE
python scripts/draw_pareto_front.py lg117MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg118 EB 5 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EB 8 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EB 10 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EB 12 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EB 14 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EB 17 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EB 20 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EB 25 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EB 30 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EV 5 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EV 8 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EV 10 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EV 12 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EV 14 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EV 17 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EV 20 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EV 25 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 EV 30 2>&1 | tee -a experiments/log_202303021451186.txt
python scripts/discretize_bn.py lg118 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451186.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011860216.txt

python scripts/draw_pareto_front.py lg118MLE WRMSE
python scripts/draw_pareto_front.py lg118MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg119 EB 5 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EB 8 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EB 10 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EB 12 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EB 14 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EB 17 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EB 20 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EB 25 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EB 30 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EV 5 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EV 8 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EV 10 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EV 12 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EV 14 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EV 17 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EV 20 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EV 25 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 EV 30 2>&1 | tee -a experiments/log_202303021451196.txt
python scripts/discretize_bn.py lg119 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451196.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011960216.txt

python scripts/draw_pareto_front.py lg119MLE WRMSE
python scripts/draw_pareto_front.py lg119MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg120 EB 5 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EB 8 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EB 10 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EB 12 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EB 14 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EB 17 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EB 20 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EB 25 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EB 30 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EV 5 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EV 8 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EV 10 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EV 12 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EV 14 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EV 17 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EV 20 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EV 25 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 EV 30 2>&1 | tee -a experiments/log_202303021451206.txt
python scripts/discretize_bn.py lg120 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451206.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012060216.txt

python scripts/draw_pareto_front.py lg120MLE WRMSE
python scripts/draw_pareto_front.py lg120MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg121 EB 5 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EB 8 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EB 10 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EB 12 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EB 14 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EB 17 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EB 20 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EB 25 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EB 30 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EV 5 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EV 8 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EV 10 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EV 12 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EV 14 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EV 17 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EV 20 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EV 25 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 EV 30 2>&1 | tee -a experiments/log_202303021451216.txt
python scripts/discretize_bn.py lg121 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451216.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012160216.txt

python scripts/draw_pareto_front.py lg121MLE WRMSE
python scripts/draw_pareto_front.py lg121MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg122 EB 5 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EB 8 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EB 10 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EB 12 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EB 14 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EB 17 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EB 20 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EB 25 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EB 30 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EV 5 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EV 8 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EV 10 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EV 12 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EV 14 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EV 17 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EV 20 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EV 25 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 EV 30 2>&1 | tee -a experiments/log_202303021451226.txt
python scripts/discretize_bn.py lg122 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451226.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012260216.txt

python scripts/draw_pareto_front.py lg122MLE WRMSE
python scripts/draw_pareto_front.py lg122MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg123 EB 5 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EB 8 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EB 10 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EB 12 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EB 14 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EB 17 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EB 20 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EB 25 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EB 30 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EV 5 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EV 8 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EV 10 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EV 12 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EV 14 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EV 17 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EV 20 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EV 25 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 EV 30 2>&1 | tee -a experiments/log_202303021451236.txt
python scripts/discretize_bn.py lg123 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451236.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012360216.txt

python scripts/draw_pareto_front.py lg123MLE WRMSE
python scripts/draw_pareto_front.py lg123MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg124 EB 5 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EB 8 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EB 10 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EB 12 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EB 14 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EB 17 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EB 20 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EB 25 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EB 30 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EV 5 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EV 8 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EV 10 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EV 12 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EV 14 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EV 17 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EV 20 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EV 25 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 EV 30 2>&1 | tee -a experiments/log_202303021451246.txt
python scripts/discretize_bn.py lg124 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451246.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012460216.txt

python scripts/draw_pareto_front.py lg124MLE WRMSE
python scripts/draw_pareto_front.py lg124MLE Wass_multi


# Discretize BNs
python scripts/discretize_bn.py lg125 EB 5 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EB 8 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EB 10 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EB 12 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EB 14 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EB 17 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EB 20 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EB 25 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EB 30 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EV 5 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EV 8 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EV 10 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EV 12 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EV 14 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EV 17 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EV 20 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EV 25 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 EV 30 2>&1 | tee -a experiments/log_202303021451256.txt
python scripts/discretize_bn.py lg125 MDLP 2 --target_variable E 2>&1 | tee -a experiments/log_202303021451256.txt

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EB5 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EB8 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EB10 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EB12 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EB14 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EB17 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EB20 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EB25 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EB30 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EV5 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EV8 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EV10 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EV12 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EV14 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EV17 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EV20 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EV25 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_EV30 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125MLE/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012560216.txt

python scripts/draw_pareto_front.py lg125MLE WRMSE
python scripts/draw_pareto_front.py lg125MLE Wass_multi

# Discretize BNs
python scripts/discretize_bn.py lg9 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg9 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg9 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EB5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EB8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EB10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EB12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EB14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EB17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EB20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EB25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EB30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EV5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EV8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EV10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EV12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EV14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EV17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EV20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EV25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_EV30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayes/data_lg_MDLP 2>&1 

python scripts/draw_pareto_front.py lg9Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg9Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg10 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg10 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg10 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EB5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EB8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EB10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EB12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EB14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EB17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EB20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EB25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EB30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EV5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EV8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EV10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EV12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EV14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EV17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EV20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EV25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_EV30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayes/data_lg_MDLP 2>&1 

python scripts/draw_pareto_front.py lg10Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg10Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg11 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg11 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg11 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EB5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EB8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EB10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EB12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EB14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EB17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EB20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EB25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EB30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EV5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EV8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EV10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EV12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EV14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EV17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EV20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EV25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_EV30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayes/data_lg_MDLP 2>&1 

python scripts/draw_pareto_front.py lg11Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg11Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg12 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg12 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg12 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301260216.txt

python scripts/draw_pareto_front.py lg12Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg12Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg13 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg13 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg13 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301360216.txt

python scripts/draw_pareto_front.py lg13Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg13Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg14 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg14 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg14 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301460216.txt

python scripts/draw_pareto_front.py lg14Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg14Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg15 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg15 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg15 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301560216.txt

python scripts/draw_pareto_front.py lg15Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg15Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg16 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg16 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg16 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301660216.txt

python scripts/draw_pareto_front.py lg16Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg16Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg17 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg17 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg17 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301760216.txt

python scripts/draw_pareto_front.py lg17Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg17Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg18 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg18 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg18 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301860216.txt

python scripts/draw_pareto_front.py lg18Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg18Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg19 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg19 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg19 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301960216.txt

python scripts/draw_pareto_front.py lg19Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg19Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg101 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg101 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg101 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010160216.txt

python scripts/draw_pareto_front.py lg101Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg101Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg102 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg102 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg102 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010260216.txt

python scripts/draw_pareto_front.py lg102Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg102Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg103 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg103 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg103 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010360216.txt

python scripts/draw_pareto_front.py lg103Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg103Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg104 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg104 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg104 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010460216.txt

python scripts/draw_pareto_front.py lg104Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg104Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg105 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg105 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg105 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010560216.txt

python scripts/draw_pareto_front.py lg105Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg105Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg106 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg106 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg106 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010660216.txt

python scripts/draw_pareto_front.py lg106Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg106Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg107 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg107 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg107 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010760216.txt

python scripts/draw_pareto_front.py lg107Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg107Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg108 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg108 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg108 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010860216.txt

python scripts/draw_pareto_front.py lg108Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg108Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg109 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg109 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg109 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010960216.txt

python scripts/draw_pareto_front.py lg109Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg109Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg110 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg110 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg110 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011060216.txt

python scripts/draw_pareto_front.py lg110Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg110Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg111 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg111 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg111 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EB122>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011160216.txt

python scripts/draw_pareto_front.py lg111Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg111Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg112 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg112 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg112 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011260216.txt

python scripts/draw_pareto_front.py lg112Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg112Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg113 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg113 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg113 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011360216.txt

python scripts/draw_pareto_front.py lg113Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg113Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg114 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg114 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg114 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011460216.txt

python scripts/draw_pareto_front.py lg114Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg114Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg115 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg115 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg115 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011560216.txt

python scripts/draw_pareto_front.py lg115Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg115Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg116 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg116 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg116 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011660216.txt

python scripts/draw_pareto_front.py lg116Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg116Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg117 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg117 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg117 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011760216.txt

python scripts/draw_pareto_front.py lg117Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg117Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg118 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg118 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg118 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011860216.txt

python scripts/draw_pareto_front.py lg118Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg118Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg119 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg119 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg119 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011960216.txt

python scripts/draw_pareto_front.py lg119Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg119Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg120 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg120 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg120 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012060216.txt

python scripts/draw_pareto_front.py lg120Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg120Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg121 EB 5 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EB 8 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EB 10 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EB 12 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EB 14 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EB 17 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EB 20 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EB 25 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EB 30 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EV 5 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EV 8 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EV 10 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EV 12 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EV 14 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EV 17 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EV 20 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EV 25 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 EV 30 2>&1 --CPT_method Bayes
python scripts/discretize_bn.py lg121 MDLP 2 --target_variable E 2>&1 --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012160216.txt

python scripts/draw_pareto_front.py lg121Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg121Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg122 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg122 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg122 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012260216.txt

python scripts/draw_pareto_front.py lg122Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg122Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg123 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg123 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg123 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012360216.txt

python scripts/draw_pareto_front.py lg123Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg123Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg124 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg124 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg124 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012460216.txt

python scripts/draw_pareto_front.py lg124Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg124Bayes Wass_multi --CPT_method Bayes


# Discretize BNs
python scripts/discretize_bn.py lg125 EB 5 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EB 8 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EB 10 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EB 12 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EB 14 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EB 17 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EB 20 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EB 25 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EB 30 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EV 5 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EV 8 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EV 10 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EV 12 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EV 14 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EV 17 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EV 20 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EV 25 --CPT_method Bayes
python scripts/discretize_bn.py lg125 EV 30 --CPT_method Bayes
python scripts/discretize_bn.py lg125 MDLP 2 --target_variable E --CPT_method Bayes

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EB5 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EB8 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EB10 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EB12 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EB14 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EB17 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EB20 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EB25 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EB30 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EV5 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EV8 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EV10 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EV12 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EV14 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EV17 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EV20 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EV25 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_EV30 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayes/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012560216.txt

python scripts/draw_pareto_front.py lg125Bayes WRMSE --CPT_method Bayes
python scripts/draw_pareto_front.py lg125Bayes Wass_multi --CPT_method Bayes

# Discretize BNs
python scripts/discretize_bn.py lg9 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg9 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EB5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EB8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EB10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EB12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EB14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EB17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EB20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EB25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EB30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EV5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EV8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EV10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EV12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EV14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EV17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EV20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EV25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_EV30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian9Bayespriors/data_lg_MDLP 2>&1 

python scripts/draw_pareto_front.py lg9Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg9Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg10 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg10 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EB5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EB8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EB10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EB12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EB14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EB17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EB20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EB25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EB30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EV5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EV8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EV10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EV12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EV14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EV17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EV20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EV25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_EV30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian10Bayespriors/data_lg_MDLP 2>&1 

python scripts/draw_pareto_front.py lg10Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg10Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg11 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg11 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EB5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EB8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EB10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EB12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EB14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EB17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EB20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EB25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EB30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EV5 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EV8 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EV10 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EV12 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EV14 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EV17 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EV20 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EV25 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_EV30 2>&1 
./dd_inference/build/analyze_bn models/linear_gaussian11Bayespriors/data_lg_MDLP 2>&1 

python scripts/draw_pareto_front.py lg11Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg11Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg12 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg12 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_20230301260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian12Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301260216.txt

python scripts/draw_pareto_front.py lg12Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg12Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg13 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg13 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_20230301360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian13Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301360216.txt

python scripts/draw_pareto_front.py lg13Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg13Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg14 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg14 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_20230301460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian14Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301460216.txt

python scripts/draw_pareto_front.py lg14Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg14Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg15 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg15 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_20230301560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian15Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301560216.txt

python scripts/draw_pareto_front.py lg15Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg15Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg16 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg16 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_20230301660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian16Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301660216.txt

python scripts/draw_pareto_front.py lg16Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg16Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg17 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg17 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_20230301760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian17Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301760216.txt

python scripts/draw_pareto_front.py lg17Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg17Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg18 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg18 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_20230301860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian18Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301860216.txt

python scripts/draw_pareto_front.py lg18Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg18Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg19 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg19 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_20230301960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian19Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_20230301960216.txt

python scripts/draw_pareto_front.py lg19Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg19Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg101 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg101 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303010160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian101Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010160216.txt

python scripts/draw_pareto_front.py lg101Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg101Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg102 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg102 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303010260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian102Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010260216.txt

python scripts/draw_pareto_front.py lg102Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg102Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg103 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg103 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303010360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian103Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010360216.txt

python scripts/draw_pareto_front.py lg103Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg103Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg104 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg104 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303010460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian104Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010460216.txt

python scripts/draw_pareto_front.py lg104Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg104Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg105 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg105 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303010560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian105Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010560216.txt

python scripts/draw_pareto_front.py lg105Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg105Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg106 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg106 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303010660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian106Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010660216.txt

python scripts/draw_pareto_front.py lg106Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg106Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg107 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg107 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303010760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian107Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010760216.txt

python scripts/draw_pareto_front.py lg107Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg107Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg108 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg108 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303010860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian108Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010860216.txt

python scripts/draw_pareto_front.py lg108Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg108Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg109 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg109 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303010960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian109Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303010960216.txt

python scripts/draw_pareto_front.py lg109Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg109Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg110 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg110 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian110Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011060216.txt

python scripts/draw_pareto_front.py lg110Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg110Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg111 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg111 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EB122>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian111Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011160216.txt

python scripts/draw_pareto_front.py lg111Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg111Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg112 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg112 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian112Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011260216.txt

python scripts/draw_pareto_front.py lg112Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg112Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg113 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg113 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian113Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011360216.txt

python scripts/draw_pareto_front.py lg113Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg113Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg114 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg114 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian114Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011460216.txt

python scripts/draw_pareto_front.py lg114Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg114Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg115 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg115 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian115Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011560216.txt

python scripts/draw_pareto_front.py lg115Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg115Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg116 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg116 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011660216.txt
./dd_inference/build/analyze_bn models/linear_gaussian116Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011660216.txt

python scripts/draw_pareto_front.py lg116Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg116Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg117 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg117 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011760216.txt
./dd_inference/build/analyze_bn models/linear_gaussian117Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011760216.txt

python scripts/draw_pareto_front.py lg117Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg117Bayespriors Wass_multi --CPT_method Bayespriors

# Discretize BNs
python scripts/discretize_bn.py lg118 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg118 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011860216.txt
./dd_inference/build/analyze_bn models/linear_gaussian118Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011860216.txt

python scripts/draw_pareto_front.py lg118Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg118Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg119 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg119 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303011960216.txt
./dd_inference/build/analyze_bn models/linear_gaussian119Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303011960216.txt

python scripts/draw_pareto_front.py lg119Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg119Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg120 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg120 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303012060216.txt
./dd_inference/build/analyze_bn models/linear_gaussian120Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012060216.txt

python scripts/draw_pareto_front.py lg120Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg120Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg121 EB 5 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EB 8 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EB 10 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EB 12 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EB 14 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EB 17 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EB 20 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EB 25 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EB 30 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EV 5 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EV 8 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EV 10 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EV 12 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EV 14 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EV 17 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EV 20 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EV 25 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 EV 30 2>&1 --CPT_method Bayespriors
python scripts/discretize_bn.py lg121 MDLP 2 --target_variable E 2>&1 --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303012160216.txt
./dd_inference/build/analyze_bn models/linear_gaussian121Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012160216.txt

python scripts/draw_pareto_front.py lg121Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg121Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg122 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg122 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303012260216.txt
./dd_inference/build/analyze_bn models/linear_gaussian122Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012260216.txt

python scripts/draw_pareto_front.py lg122Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg122Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg123 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg123 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303012360216.txt
./dd_inference/build/analyze_bn models/linear_gaussian123Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012360216.txt

python scripts/draw_pareto_front.py lg123Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg123Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg124 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg124 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303012460216.txt
./dd_inference/build/analyze_bn models/linear_gaussian124Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012460216.txt

python scripts/draw_pareto_front.py lg124Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg124Bayespriors Wass_multi --CPT_method Bayespriors


# Discretize BNs
python scripts/discretize_bn.py lg125 EB 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EB 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EB 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EB 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EB 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EB 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EB 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EB 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EB 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EV 5 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EV 8 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EV 10 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EV 12 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EV 14 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EV 17 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EV 20 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EV 25 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 EV 30 --CPT_method Bayespriors
python scripts/discretize_bn.py lg125 MDLP 2 --target_variable E --CPT_method Bayespriors

# generate DDs from .cnf
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EB5 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EB8 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EB10 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EB12 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EB14 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EB17 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EB20 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EB25 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EB30 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EV5 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EV8 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EV10 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EV12 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EV14 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EV17 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EV20 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EV25 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_EV30 2>&1 | tee -a experiments/log_202303012560216.txt
./dd_inference/build/analyze_bn models/linear_gaussian125Bayespriors/data_lg_MDLP 2>&1 | tee -a experiments/log_202303012560216.txt

python scripts/draw_pareto_front.py lg125Bayespriors WRMSE --CPT_method Bayespriors
python scripts/draw_pareto_front.py lg125Bayespriors Wass_multi --CPT_method Bayespriors
