#!/bin/bash

cd libmo_unpack
./make_library
./distribute.sh $PREFIX
#gcc -c -fPIC -O4 -mfpmath=sse -msse -I include -D_LARGEFILE_SOURCE *.c
#gcc -shared -Wl,-soname,libmo_unpack.so -o lib/libmo_unpack.so *.o
#cp lib/* $PREFIX/lib
#cp include/* $PREFIX/include
