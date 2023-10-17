"""Setup script."""
# pylint: disable=protected-access

import os
import platform

import setuptools
from pybind11.setup_helpers import Pybind11Extension, build_ext

assert platform.system() in ("Linux", "Darwin")

__version__ = "1.0.0"
os.environ["CC"] = "g++"
os.environ["CXX"] = "g++"

base_dir = os.path.realpath(os.path.dirname(__file__))
sylvan_so = os.path.join(
    base_dir, "dd_inference/sylvan_build/src/libsylvan.so"
)

ext = Pybind11Extension(
    "dd_inference.ddcpp", 
    [
        "dd_inference/bnbdd_inference.cpp", 
        "dd_inference/interface.cpp"
    ], 
    include_dirs=[
        "include",
        "dd_inference",
        "extern/sylvan/src"
    ],
    cxx_std=17
)

ext._add_cflags(["-O2"])
ext._add_ldflags([f"-L{os.path.dirname(sylvan_so)}", f"-lsylvan"])

setuptools.setup(
    name='dd_inference',
    version=__version__,
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(),
    cmdclass={"build_ext": build_ext},
    ext_modules=[ext],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
