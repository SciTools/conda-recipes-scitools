#!/bin/bash

export LDFLAGS=-L$LD_RUN_PATH
sh configure --prefix=$PREFIX --enable-shared
make
make install
