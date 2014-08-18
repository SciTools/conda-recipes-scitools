#!/bin/bash

CFLAGS="-fPIC" ./configure --prefix=$PREFIX --with-jasper=$PREFIX --disable-fortran \
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

echo "Saving $PREFIX to $PREFIX/.build_prefix.a"
# Record where this build was made for subsequent use in post-link.sh.
# NB. Use the ".a" suffix so conda doesn't treat this as a text file and
# automatically add it to the has_prefix_files category (with the
# resulting with /opt/anaconda1anaconda2).
echo "$PREFIX" > $PREFIX/.build_prefix.a
