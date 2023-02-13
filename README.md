# BN inference with DDs


## Dependencies


* Dependencies of [Sylvan](https://github.com/trolando/sylvan).
* [Graphviz](https://graphviz.org/) for visualization of BNs
* Python + packages in [requirements.txt](requirements.txt)
```bash
# install Sylvan dependencies
sudo apt install cmake cmake-data build-essential
sudo apt install libgmp-dev

# install Graphviz (optional)
sudo apt install graphviz graphviz-dev

# create a virtual environment (optional)
python -m venv .venv
source .venv/bin/activate

# install dependencies
pip install -r requirements.txt
```

## Installation (Linux)

1. Clone the repo (including submodules)
2. To compile everything, run
```shell
$ ./compile_sources.sh
```

## Run the code
To generate a Bayesian network in data `.csv` format and settings `.json`, run
```shell
$ python scripts/generate_bn.py distribution
```

To discretize a Bayesian network to `.xmlbif` format and settings `.json`, run
```shell
$ python scripts/discretize_bn.py model discretization_method bins --target_column
```

for example: 
```shell
$ python scripts/generate_bn.py lg
$ python scripts/discretize_bn.py lg5000 disc 10
```

To turn a Bayesian network in `.xmlbif` format into a CNF formula, run
```shell
$ python scripts/parse_bn.py models/model_name.xmlbif
```

To run run inference (**TODO:** add cl options to run specific queries? We can also do the entire optimization in C++.)
```shell
$ ./dd_inference/build/analyze_bn models/model_name
```

