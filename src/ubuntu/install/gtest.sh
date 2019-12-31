#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# The below procedure is tested on Ubuntu 18.
apt-get update
apt-get install -y googletest cmake

cd /usr/src/googletest
mkdir build
cd build
cmake .. -DBUILD_GMOCK=ON -DBUILD_GTEST=ON
make

# copy libgtest.a  libgtest_main.a
cd /usr/src/googletest/build/googlemock/gtest
cp *.a /usr/lib
# copy libgmock.a  libgmock_main.a
cd /usr/src/googletest/build/googlemock
cp *.a /usr/lib

cd /usr/src/googletest
rm -rf ./build

