#!/bin/bash

# Make sure Iris can find the udunits library while it's in the temporary
# build environment. This is necessary because the build process also compiles
# the pyke rules, which requires importing iris.

SITECFG=lib/iris/etc/site.cfg
echo "[System]" > $SITECFG
echo "udunits2_path = $PREFIX/lib/libudunits2${SHLIB_EXT}" >> $SITECFG 

rm -rf lib/iris/tests/results lib/iris/tests/*.npz

$PYTHON -sE setup.py --with-unpack build_ext "-I${PREFIX}/include" "-L${PREFIX}/lib" "-R${PREFIX}/lib" install --single-version-externally-managed --record record.txt
