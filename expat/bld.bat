mkdir build
cd build

copy %RECIPE_DIR%\stdint.h .


cmake .. -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%
nmake install

:: Udunits is looking for a libexpat.lib.
copy %LIBRARY_LIB%\expat.lib %LIBRARY_LIB%\libexpat.lib
