#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# https://www.eriksmistad.no/getting-started-with-google-test-on-ubuntu/
apt-get update
apt-get install -y libgtest-dev cmake

cd /usr/src/gtest
cmake CMakeLists.txt
make

# copy or symlink libgtest.a and libgtest_main.a to your /usr/lib folder
cp *.a /usr/lib
rm -rf CMakeFiles \
 libgtest_main.a \
 libgtest.a \
 cmake_install.cmake \
 Makefile \
 CMakeCache.txt

cd /usr/src/gmock
cmake CMakeLists.txt
make

# copy or symlink libgtest.a and libgtest_main.a to your /usr/lib folder
cp *.a /usr/lib
rm -rf CMakeFiles \
 gtest \
 libgmock.a \
 libgmock_main.a \
 cmake_install.cmake \
 Makefile \
 CMakeCache.txt

