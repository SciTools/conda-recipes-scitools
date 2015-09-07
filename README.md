# Conda Recipes SciTools

[![Build Status](https://secure.travis-ci.org/SciTools/conda-recipes-scitools.png)](http://travis-ci.org/SciTools/conda-recipes-scitools)
<span>&nbsp;</span>
[![Build status](https://ci.appveyor.com/api/projects/status/i4qqobqxvxwis666?svg=true)](https://ci.appveyor.com/project/scitools/conda-recipes-scitools-311)
[![Circle CI](https://circleci.com/gh/SciTools/conda-recipes-scitools/tree/master.svg?style=svg)](https://circleci.com/gh/SciTools/conda-recipes-scitools/tree/master)

(C) British Crown Copyright 2014, Met Office

Conda recipes SciTools provides conda build recipes for SciTools Python libraries and their required dependencies.
Build recipes are provided for 64-bit Linux, 64-bit Mac OSX, and 32-bit and 64-bit Windows Operating Systems.

Built recipes are available on the [SciTools binstar channel](https://binstar.org/scitools).
They can be installed using the [conda](http://conda.pydata.org/) tool.
For example, to install the latest released version of Iris from binstar:

    $ conda install -c SciTools iris

Further information on installing and using conda can be found at
<http://conda.pydata.org/docs/index.html> and
<http://conda.pydata.org/docs/custom-channels.html>.


## Build recipes

A conda build recipe must contain the certain files. These are described in the
[conda build recipe reference](http://conda.pydata.org/docs/build.html) documentation.

The build recipes in conda recipes SciTools are run automatically on Travis-CI and AppVeyor.
These runs are initiated when:
 * A pull request against conda recipes SciTools is raised.
   The conda recipes relevant to the pull request are built for testing purposes only.
 * A pull request against conda recipes SciTools is merged.
   The recipes relevant to the merge are built *and uploaded* to the
   [SciTools](https://binstar.org/scitools) channel.


### Updating an existing build recipe

Existing build recipes will need to be updated from time to time.
This may be caused by:
 * a new version of the library being released, or
 * a bug being detected in the existing build.

If you are changing an existing recipe but not changing the release version of
the library being built you **must** iterate the build number in the recipe's ``meta.yaml`` file:

    build:
        - number: 1

Iterating the build number notifies the build environment that a new version of the recipe is available.
This means the build will be run in the next execution of the conda recipes SciTools.
The changes made to the build recipe will be included in the built library.


## Building from a conda recipe

Building a SciTools conda recipe requires installing a version of conda and certain pre-requisite conda packages.
These steps assume that you have cloned the source of this repo to a local directory:
 1. Download the version of Miniconda relevant to your Operating System from <http://conda.pydata.org/miniconda.html>.
 2. Update conda to the latest version:

        $ conda update conda

 3. Install the packages `conda-build` and `binstar` to the _root_ conda environment:

        $ conda install -n root conda-build binstar

    These packages are necessary to build and upload the build recipe, respectively.

 4. If you are building on Windows you will also need Visual Studio and
    [CMake](http://www.cmake.org/download/). See also
    [this very handy guide](https://github.com/conda/conda-recipes/wiki/Building-from-Source-on-Windows-32-bit-and-64-bit)
    for more information.

 5. With the pre-requisites in place you can now build SciTools conda recipes.
    This step must take place in the local directory to which you cloned the source of this repo.
    To build a SciTools conda recipe, for example Iris:

        $ conda build iris

    This will run the commands specified by the `meta.yaml` and `build.sh` or `bld.bat`,
    whichever is relevant to your Operating System.
    Any build dependencies that also need to be built will be built automatically.

Note that runtime dependencies are not automatically built by conda.
On account of this the conda recipe for `pyepsg` must be built before building the conda recipe for Cartopy.


## Copyright and licence

(C) British Crown Copyright 2014, Met Office

This file is part of conda-recipes-scitools.

Iris is free software: you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the
Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Conda recipes SciTools is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with Conda recipes SciTools. If not, see <http://www.gnu.org/licenses/>.

