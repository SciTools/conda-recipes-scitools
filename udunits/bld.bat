mkdir build
cd build

set LIB=%LIBRARY_LIB%;.\lib;%LIB%
set LIBPATH=%LIBRARY_LIB%;.\lib;%LIBPATH%
set INCLUDE=%LIBRARY_INC%;%INCLUDE%

:: Install the udunits2 xml files.
mkdir %LIBRARY_PREFIX%\share
mkdir %LIBRARY_PREFIX%\share\udunits
copy ..\lib\*.xml %LIBRARY_PREFIX%\share\udunits\


copy %RECIPE_DIR%\unistd.h .
cmake .. -G "NMake Makefiles" -DEXPAT_LIBRARY:PATH=%LIBRARY_LIB%\expat.lib -DEXPAT_INCLUDE_DIR:PATH=%LIBRARY_INC%\expat.h -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX%

::nmake install

nmake libudunits2 || exit 1
nmake udunits2 || exit 1

::cmake --build . --config Release --target libudunits2
::cmake --build . --config Release --target udunits2

copy prog\udunits2.exe %LIBRARY_BIN%\ || exit 1
copy lib\udunits2.dll %LIBRARY_BIN%\ || exit 1
copy lib\udunits2.lib %LIBRARY_LIB%\ || exit 1

