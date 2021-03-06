#!/bin/sh
#trunk
#svn co https://svn.hdfgroup.uiuc.edu/hdf5/trunk
#cd trunk && ./autogen.sh ./configure --disable-fortran --disable-hl CC=gcc && make && make install
if [ $TRAVIS_OS_NAME = "osx" ]; then
  export CC=gcc-4.9
else
  export CC=gcc
fi
# 1.8 branch
svn co -q http://svn.hdfgroup.uiuc.edu/hdf5/branches/hdf5_1_8
cd hdf5_1_8 && ./configure --disable-fortran --disable-hl --prefix=$HOME/hdf5 && make > result.txt 2>&1 && make install
