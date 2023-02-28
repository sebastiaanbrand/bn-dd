"""
Python script which generates a (flat) bash script with experiments.
"""
import os
import argparse
import pathlib
from datetime import datetime


output_file = "experiments/exp_{}.sh"
exp_id = datetime.now().strftime("%Y%m%d%H%M%S")


parser = argparse.ArgumentParser(description='Generate bash script with experiments.')
parser.add_argument('folderpath', type=str, help='Path to folder with .cnf files.')


def all_bn_to_cnf(folder):
    """
    For a given folder with .xmlbif files, generate .cnf files (+ some other 
    files) wich form a (weighted) CNF encoding of the BN.
    """
    # NOTE: "2>&1 | tee" writes all console output to a file,
    command = "python scripts/parse_bn.py {} 2>&1 | tee -a experiments/log_{}.txt\n"
    with open(output_file.format(exp_id), 'a', encoding='utf-8') as outfile:
        outfile.write("# generate CNF from .xmlbif\n")
        for filename in os.listdir(folder):
            if filename.endswith('.xmlbif'):
                filepath = os.path.join(folder, filename)
                outfile.write(command.format(filepath, exp_id))
        outfile.write("\n")


def all_cnf_to_dd(folder):
    """
    For a given folder with .cnf files which encode BNs, generate the bash
    commands to generate DDs for all of these .cnf files.
    """
    command = "./dd_inference/build/analyze_bn {} 2>&1 | tee -a experiments/log_{}.txt\n"
    with open(output_file.format(exp_id), 'a', encoding='utf-8') as outfile:
        outfile.write("# generate DDs from .cnf\n")
        for filename in os.listdir(folder):
            if filename.endswith('.cnf'):
                stripped_path = os.path.join(folder, filename[:-4])
                outfile.write(command.format(stripped_path, exp_id))


def main():
    """
    Generate single bash file with complete experiments.
    """
    args = parser.parse_args()
    folder = args.folderpath
    pathlib.Path("experiments/").mkdir(parents=True, exist_ok=True)

    with open(output_file.format(exp_id), 'w', encoding='utf-8') as outfile:
        outfile.write("#!/bin/bash\n")
        outfile.write(f"# experiments for folder {folder}\n\n")

    # 1. generate_bn
    # TODO

    # 2. discretize using different methods
    # TODO

    # 3. translate discretized BN to CNF
    all_bn_to_cnf(folder)

    # 4. construct DD from CNF
    all_cnf_to_dd(folder)

    # 5. plot pareto front for different distance metrics
    # TODO 


if __name__ == '__main__':
    main()
