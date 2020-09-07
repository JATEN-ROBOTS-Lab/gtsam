#!/bin/bash

curdir="$(pwd)"
rootdir="$(dirname ${0})"

install_dir="${HOME}/install/gtsam"

cd "${rootdir}/build"

#cmake ../gtsam-4.0.2/ \
#      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
#      -DCMAKE_INSTALL_PREFIX:PATH=${HOME}/install/gtsam \
#      -DGTSAM_TOOLBOX_INSTALL_PATH:PATH=${HOME}/install/gtsam/toolbox


cmake "../gtsam/" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX:PATH="${install_dir}" \
      -DGTSAM_TOOLBOX_INSTALL_PATH:PATH="${install_dir}/toolbox" \
      -DGTSAM_USE_SYSTEM_EIGEN="ON" \
      -DGTSAM_BUILD_WITH_MARCH_NATIVE="OFF"  
## Note: GTSAM_BUILD_WITH_MARCH_NATIVE causes the "-march=native" flag added, which will bring problem for LIO-SAM compiling without it.
## Reference: [https://github.com/borglab/gtsam/issues/75]



#make check -j8 -l8
#make clean
#make -B -j8 -l8
make -j8 -l8
make install -j8 -l8

cd "${curdir}"
