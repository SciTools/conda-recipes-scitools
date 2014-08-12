#!/bin/bash

cd libmo_unpack

gcc -c -fPIC -O4 -mfpmath=sse -msse -I include -D_LARGEFILE_SOURCE *.c
gcc -shared -Wl,-soname,libmo_unpack.so -o lib/libmo_unpack.so *.o

# Actually install the built product.
mkdir $PREFIX/lib $PREFIX/include
cp lib/* $PREFIX/lib
cp include/* $PREFIX/include
