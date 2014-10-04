#!/bin/bash

if [ ! -f configure ];
then
   # Make the configure file
   autoreconf -i --force
fi

./configure --prefix=$PREFIX
make
make install
