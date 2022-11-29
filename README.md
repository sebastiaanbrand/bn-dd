# BN inference with DDs


## Dependencies

* Python (**TODO:** add packages dependencies + venv instructions)
* Dependencies of [Sylvan](https://github.com/trolando/sylvan).


## Installation (Linux)

1. Clone the repo (including submodules)
2. To compile everything, run
```shell
$ ./compile_sources.sh
```

## Run the code

To turn a Bayesian network in `.xmlbif` format into a CNF formula, run
```shell
$ python scripts/parse_bn.py models/model_name.xmlbif
```

To run run inference (**TODO:** add cl options to run specific queries? We can also do the entire optimization in C++.)
```shell
$ ./dd_inference/build/analyze_bn models/model_name
```

