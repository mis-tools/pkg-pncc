#!/usr/bin/env bash
set -e
#set -x
script_dir=$(dirname "$0")
cwd=`pwd`

# make
build_dir="build"
install_dir="../debian/usr"
#rm -rf ${build_dir} ${install_dir}
mkdir -p ${build_dir}
cd ${build_dir}
cmake ../deps/pncc/ \
-DCMAKE_INSTALL_PREFIX=${install_dir} \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE \
-DCMAKE_EXE_LINKER_FLAGS="-static" 
n=`nproc`
make -j $n
make install
cd $cwd
