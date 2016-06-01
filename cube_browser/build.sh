#!/bin/bash

if [[ $(uname) == "Darwin" ]]; then
    EXT=dylib
else
    EXT=so
fi

python setup.py install --single-version-externally-managed --record record.txt