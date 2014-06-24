#!/bin/bash

export LDFLAGS=-L$LD_RUN_PATH
export C_INCLUDE_PATH=$INCLUDE_PATH

sh configure --prefix=$PREFIX --enable-shared --disable-debug --disable-dependency-tracking

make
make install
