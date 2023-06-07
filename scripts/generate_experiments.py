"""
Python script which generates a (flat) bash script with experiments.
"""
import os
import argparse
import pathlib
from datetime import datetime
from itertools import product

output_file = "experiments/exp_{}{}_{}.sh"
exp_id = datetime.now().strftime("%Y%m%d%H%M%S")


parser = argparse.ArgumentParser(description='Generate bash script with experiments.')
parser.add_argument('distribution', type=str, choices=['lg','tb','nm'], help='Distribution to use')
parser.add_argument('experiment', type=str, help='Experiment to use')
dist_mapping = {'lg':'linear_gaussian',
                'tb':'tuebingen',
                'nm':'normal_mixture'}
methods = ['EB','EV']
bins = [5,8,10,12,14]
errors = ['Wass1D','Wass_multi']
errors_all = ['Wass1D','Wass_multi','RMSE','WRMSE',]


def generate_bns(dist, exp):
    """
    For a given distribution and experiment, generate all the BN data and settings json
    """
    command = "python scripts/generate_bn.py {} {} 2>&1 | tee -a experiments/log_{}.txt\n".format(dist,exp,exp_id)
    with open(output_file.format(dist, exp, exp_id), 'a', encoding='utf-8') as outfile:
        outfile.write("# Generate BN\n")
        outfile.write(command)
        outfile.write("\n")


def discretize_BNs(dist, exp):
    """
    For a given distribution and experiment, generate all the .xmlbif and settings file for all discretizations
    """
    command = "python scripts/discretize_bn.py {} {} {} 2>&1 | tee -a experiments/log_{}.txt\n"
    with open(output_file.format(dist, exp, exp_id), 'a', encoding='utf-8') as outfile:
        outfile.write("# Discretize BNs\n")
        for meth, bin in product(methods, bins):
            if meth!='MDLP':
                outfile.write(command.format(dist+exp, meth, bin, exp_id))
        # Add MDLP command
        if dist=='lg':
            outfile.write(command.format(dist+exp+" MDLP",2,"--target_variable E",exp_id)) 
        if dist=='nm':
            outfile.write(command.format(dist+exp+" MDLP",2,"--target_variable Y",exp_id)) 
        if dist=='tb':
            outfile.write(command.format(dist+exp+" MDLP",2,"--target_variable B",exp_id)) 
        outfile.write("\n")


def all_bn_to_cnf(dist, exp, folder):
    """
    For a given folder with .xmlbif files, generate .cnf files (+ some other 
    files) wich form a (weighted) CNF encoding of the BN.
    """
    # NOTE: "2>&1 | tee" writes all console output to a file,
    command = "python scripts/bn_to_cnf.py {} 2>&1 | tee -a experiments/log_{}.txt\n"
    with open(output_file.format(dist, exp, exp_id), 'a', encoding='utf-8') as outfile:
        outfile.write("# generate CNF from .xmlbif\n")
        for filename in os.listdir(folder):
            if filename.endswith('.xmlbif'):
                filepath = os.path.join(folder, filename)
                outfile.write(command.format(filepath, exp_id))
        outfile.write("\n")


def all_cnf_to_dd(dist, exp, folder):
    """
    For a given folder with .cnf files which encode BNs, generate the bash
    commands to generate DDs for all of these .cnf files.
    """
    command = "./dd_inference/build/analyze_bn {} 2>&1 | tee -a experiments/log_{}.txt\n"
    with open(output_file.format(dist, exp, exp_id), 'a', encoding='utf-8') as outfile:
        outfile.write("# generate DDs from .cnf\n")
        for filename in os.listdir(folder):
            if filename.endswith('.cnf'):
                stripped_path = os.path.join(folder, filename[:-4])
                outfile.write(command.format(stripped_path, exp_id))
        outfile.write("\n")

def draw_pareto(dist, exp):
    """
    For a given distribution and experiment, generate all the BN data and settings json
    """
    command = "python scripts/draw_pareto_front.py {} {} 2>&1 | tee -a experiments/log_{}.txt\n"
    with open(output_file.format(dist, exp, exp_id), 'a', encoding='utf-8') as outfile:
        outfile.write("# Draw Pareto_front\n")
        for error in errors_all:
            outfile.write(command.format(dist+exp, error,exp_id))
        outfile.write("\n")


def main():
    """
    Generate single bash file with complete experiments.
    """
    args = parser.parse_args()
    distribution = args.distribution
    experiment = args.experiment
    folder = "models/{dis}{exp}".format(dis=dist_mapping[distribution], exp=experiment)
    pathlib.Path("experiments/").mkdir(parents=True, exist_ok=True)

    with open(output_file.format(distribution, experiment, exp_id), 'w', encoding='utf-8') as outfile:
        outfile.write("#!/bin/bash\n")
        outfile.write(f"# experiments for folder {folder}\n\n")

    # 1. generate_bn
    generate_bns(distribution, experiment)

    # 2. discretize using different methods
    discretize_BNs(distribution, experiment)

    # 3. translate discretized BN to CNF
    # By default, the discretize_bn script now outputs cnf directly
    #all_bn_to_cnf(distribution, experiment, folder)

    # 4. construct DD from CNF
    all_cnf_to_dd(distribution, experiment, folder)

    # 5. plot pareto front for different distance metrics
    draw_pareto(distribution,experiment)


if __name__ == '__main__':
    main()
