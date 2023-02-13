"""
Python script which generates a (flat) bash script with experiments.
"""
import os
import argparse
import pathlib
from datetime import datetime


output_file = "experiments/exp_{}.sh"
command = "./dd_inference/build/analyze_bn {} 2>&1 | tee -a experiments/log_{}.txt\n"
exp_id = datetime.now().strftime("%Y%m%d%H%M%S")


parser = argparse.ArgumentParser(description='Generate bash script with experiments.')
parser.add_argument('folderpath', type=str, help='Path to folder with .cnf files.')


def all_bn_to_dd(folder):
    pathlib.Path("experiments/").mkdir(parents=True, exist_ok=True)
    with open(output_file.format(exp_id), 'w') as outfile:
        outfile.write("#!/bin/bash\n\n")
        for filename in os.listdir(folder):
            if filename.endswith('.cnf'):
                stripped_path = os.path.join(folder, filename[:-4])
                outfile.write(command.format(stripped_path, exp_id))


if __name__ == '__main__':

    args = parser.parse_args()
    folder = args.folderpath
    all_bn_to_dd(folder)
