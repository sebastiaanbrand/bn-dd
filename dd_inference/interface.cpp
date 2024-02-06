#include <pybind11/pybind11.h>
#include <pybind11/chrono.h>
#include <pybind11/complex.h>
#include <pybind11/functional.h>
#include <pybind11/numpy.h>
#include <pybind11/stl.h>

#include "bnbdd_inference.hpp"

namespace py = pybind11;

void init_system(unsigned int n_workers = 1, size_t dqsize = 0){
    lace_start(n_workers, dqsize);

    sylvan::sylvan_set_sizes(1LL<<28, 1LL<<28, 1LL<<16, 1LL<<16);
    sylvan::sylvan_init_package();
    sylvan::sylvan_init_bdd();
}

void shutdown_system() {
    sylvan::sylvan_quit();
    lace_stop();   
}


PYBIND11_MODULE(ddcpp, m)
{
    m.def("init_system", &init_system, py::arg("n_workers") = 1, py::arg("dqsize") = 0);
    m.def("shutdown_system", &shutdown_system);
        
    py::class_<sylvan::Bdd>(m, "Bdd");

    py::class_<BnBdd>(m, "BnBdd")
        .def_readwrite("dd", &BnBdd::dd)
        .def_readwrite("pm", &BnBdd::pm)
        .def_readwrite("rv_vars", &BnBdd::rv_vars)
        .def_readwrite("nvars", &BnBdd::nvars)
        .def_readwrite("peaknodes", &BnBdd::peaknodes)
        .def_readwrite("build_time", &BnBdd::build_time)
        .def_readwrite("bn2cnf_time", &BnBdd::bn2cnf_time); 

    m.def("bnbdd_marginalize", &bnbdd_marginalize,
          py::arg("bnbdd"), py::arg("constraint_x"));

    m.def("bnbdd_do_naive", &bnbdd_do_naiv
        py::arg("bnbdd"), py::arg("constraint_x"), py::arg("constraint_t"), py::arg("pt")
    );
  
    m.def("bnbdd_condition", &bnbdd_condition,
          py::arg("bnbdd"), py::arg("constraint_x"), py::arg("constraint_y"));

    m.def("bnbdd_do", &bnbdd_do,
          py::arg("bnbdd"), py::arg("constraint_x"), py::arg("constraint_t"), py::arg("pt"));

    m.def("bnbdd_from_files", &bnbdd_from_files,
          py::arg("filepath"), py::arg("tracepeak") = false, py::arg("verbose") = false);

    m.def("cnf_from_file", &cnf_from_file,
          py::arg("filepath"), py::arg("bn_to_cnf_time"));

    m.def("print_cnf", &print_cnf, py::arg("cnf"));
    m.def("cnf_to_bdd", &cnf_to_bdd,
          py::arg("cnf"), py::arg("tracepeak") = false, py::arg("peaknodes") = nullptr);
    m.def("probs_from_file", &probs_from_file, py::arg("filepath"));
    m.def("rv_vars_from_file", &rv_vars_from_file, py::arg("filepath"));
    m.def("print_probmap", &print_probmap, py::arg("pm"));
    m.def("print_rv_vars", &print_rv_vars, py::arg("rv_vars"));
}
