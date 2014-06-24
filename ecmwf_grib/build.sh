#!/bin/bash

./configure --prefix=$PREFIX --with-jasper=$PREFIX --disable-fortran \
    --enable-python
make
make install

# For some reason the installer places the Python files in a sub-directory
# of site-packages called "grib_api". (NB. The sub-directory is not a package.)
# The install instructions in python/README include the suggestion:
#   Add this folder to your PYTHONPATH and you are ready to go.
# Instead of that, we just move them back up into the site-packages directory.
mv $SP_DIR/grib_api/* $SP_DIR/
rmdir $SP_DIR/grib_api
