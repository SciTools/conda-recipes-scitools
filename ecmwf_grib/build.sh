#!/bin/bash

mkdir -p $PREFIX/bin
cp $SYS_PYTHON-config $PREFIX/bin/

LDFLAGS="-L$PREFIX/lib" PYTHON="$PYTHON" PYTHON_LDFLAGS=$PREFIX/lib CFLAGS="-fPIC -Wl,-rpath,$PREFIX/lib" ./configure --with-jasper=$PREFIX/lib --disable-fortran --prefix=$PREFIX --enable-python

make
make install

# For some reason the installer places the Python files in a sub-directory
# of site-packages called "grib_api". (NB. The sub-directory is not a package.)
# The install instructions in python/README include the suggestion:
#   Add this folder to your PYTHONPATH and you are ready to go.
# Instead of that, we just rename the directory and make it a package.
mv $SP_DIR/grib_api $SP_DIR/gribapi
mv $SP_DIR/gribapi/gribapi.py $SP_DIR/gribapi/__init__.py

echo "Saving $PREFIX to $PREFIX/.build_prefix.a"
# Record where this build was made for subsequent use in post-link.sh.
# NB. Use the ".a" suffix so conda doesn't treat this as a text file and
# automatically add it to the has_prefix_files category (with the
# resulting with /opt/anaconda1anaconda2).
echo "$PREFIX" > $PREFIX/.build_prefix.a

