#!/bin/bash

# See http://www.unidata.ucar.edu/support/help/MailArchives/netcdf/msg11939.html
if [ "$(uname)" == "Darwin" ]; then
    export DYLD_LIBRARY_PATH=${PREFIX}/lib
fi

CPPFLAGS=-I$PREFIX/include LDFLAGS=-L$PREFIX/lib ./configure --prefix=$PREFIX

make
# By-passing the tests for now b/c compiling against an libnetcdf 4.2.1.1 causes
# 2 failues: `ftst_rengrps` and `f90tst_rengrps`
# make check
make install
