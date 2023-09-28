"""Setup script."""
# pylint: disable=protected-access

import os
import platform
from glob import glob

import setuptools
from pybind11.setup_helpers import Pybind11Extension, build_ext

__version__ = "1.0.0"

sylvan_cpp = glob("extern/sylvan/src/*.c*")
sylvan_so = "/home/jacob/code/bn-dd/dd_inference/sylvan_build/src/libsylvan.so"

ext = Pybind11Extension(
    "dd_inf.ddcpp", 
    [
        "dd_inference/wpbdd_inference.cpp", 
        "dd_inf/interface.cpp"
    ], 
    include_dirs=[
        "include",
        "dd_inference",
        "extern/sylvan/src"
    ],
    cxx_std=17
)
if platform.system() in ("Linux", "Darwin"):
    os.environ["CC"] = "g++"
    os.environ["CXX"] = "g++"
    ext._add_cflags(["-O2"])
    ext._add_ldflags([f"-L{os.path.dirname(sylvan_so)}", f"-lsylvan"])
else:
    ext._add_cflags(["/O2"])


setuptools.setup(
    name='dd_inf',
    version=__version__,
    author="Jacob de Nobel",
    author_email="jacobdenobel@gmail.com",
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
