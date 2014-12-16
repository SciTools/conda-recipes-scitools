if [[ "$OSTYPE" == "darwin"* ]]; then
    BUILD_PREFIX=$(cat ${PREFIX}/build_prefix.a | tr -d '\n')
    ${PREFIX}/patchbinary.py ${BUILD_PREFIX} ${PREFIX} ${PREFIX}/lib/libudunits2.dylib
    rm ${PREFIX}/build_prefix.a ${PREFIX}/patchbinary.py
fi
