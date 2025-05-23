# BN inference with DDs

## Dependencies

- Dependencies of [Sylvan](https://github.com/trolando/sylvan).
- [Graphviz](https://graphviz.org/) for visualization of BNs (optional)
- Python + packages in [requirements.txt](requirements.txt)

On Ubuntu these can be installed with:

```bash
# make sure the Sylvan submodule is cloned
git submodule update --init

# install Sylvan dependencies
sudo apt install cmake cmake-data build-essential
sudo apt install libgmp-dev

# install Graphviz (optional)
sudo apt install graphviz graphviz-dev

# create a virtual environment (optional)
python -m venv .venv
source .venv/bin/activate

# install dependencies TODO: update requirements.txt inc. version numbers
pip install -r requirements.txt
```


## Installation (Linux)

1. Clone the repo (including submodules)
2. Compilation has been tested with GCC/G++ 10. It might work with different version, but gcc/g++ version can be set with the following (though paths could be different).

```shell
$ export CC=/usr/bin/gcc-10
$ export CXX=/usr/bin/g++-10
```

3. To compile everything, run

```shell
$ ./compile_sources.sh
```

## Run the code

To generate all Bayesian networks of a specific distribution type in `.csv` format and settings `.json`, run

```shell
$ python scripts/generate_bn.py <distribution>
```
Distributions can be `lg` (Linear Gaussian 9-19), `lgS` (Linear Gaussian generated by Sobolt sequences 101-125), `nm` (Normal Mixture 1-8), `causalq` (causal quadratic), or `lalonde`.

To discretize a Bayesian network and convert to `.cnf`,`.xmlbif` or `.net` format (depending on chosen output type) and settings `.json`, run

```shell
$ python scripts/discretize_bn.py <model> <discretization_method> <bins> --target_variable=<target_var> --output_type={cnf,xmlbif,net} --CPT_method={MLE,Bayes,Bayespriors}
```
where the model names correspond with the folder name. For example:

```shell
$ python scripts/generate_bn.py lg 
$ python scripts/discretize_bn.py lg18 EV 30 --CPT_method=MLE
$ python scripts/generate_bn.py causalq 
$ python scripts/discretize_bn.py causal_quadratic1 MDLP 2 --CPT_method=Bayespriors --target_variable='Y' 
```

By default the discretization scripts returns the `.cnf` files necessary to build the BDD and do inference
To turn a Bayesian network in `.xmlbif` format into a CNF formula, run

```shell
$ ./dd_inference/build/analyze_bn <models/model_name>
```
For example:
```shell
$ ./dd_inference/build/analyze_bn models/linear_gaussian18MLE/data_lg_EV30
$ ./dd_inference/build/analyze_bn models/causal_quadratic1Bayespriors/data_causal_quadratic_MDLP
```

The discretization and decision diagram inference scripts output a `settings.json` and `ddinfo.json` respectively that contains errors and runtime information.
To draw the paretofront: run the following command

```shell
$ python scripts/draw_pareto_front.py <distribution> <error_metric>
```
such as 
```shell
$ python scripts/draw_pareto_front.py lg9 WRMSE
```
To run all experiments ran in the paper, one can also run the bashscript per distributions:
```shell
$ bash experiments/experiments_lg.sh
$ bash experiments/experiments_nm.sh
$ bash experiments/experiments_causalq.sh
$ bash experiments/experiments_lalonde.sh
```

All intermediates files for experiments are stored on GitHub except for some extremely large files resulting from the Lalonde distribution. These are stored on Zenodo: https://zenodo.org/records/10036198.
