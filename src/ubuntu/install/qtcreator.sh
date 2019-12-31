#!/usr/bin/env bash
# TODO: refer to https://github.com/erstrom/docker-qt for a possibly better alternative for installing qtcreator in docker.
# The qtcreator installed with the following script works fine in native Ubuntu 18,
# but it has some issues in docker. 1. Its debugger hangs and never reaches breakpoints.
# 2 By a small change e.g., Build type change from release to debug, the cmake configure step 
# often falls into infinite loop.

### every exit != 0 fails the script
set -e

mkdir -p /tmp/qtcreator
cd /tmp/qtcreator
# see https://flames-of-code.netlify.com/blog/qt-on-docker/
wget http://download.qt.io/official_releases/qt/5.14/5.14.0/qt-opensource-linux-x64-5.14.0.run -nv
chmod +x qt-opensource-linux-x64-5.14.0.run
./qt-opensource-linux-x64-5.14.0.run --script $INST_SCRIPTS/qt-noninteractive.qs --platform minimal --verbose # Do select Qt/Qt 5.14.0/Desktop gcc 64-bit so as to avoid issue "No valid kits found" in Qt Creator.

rm -rf /tmp/qtcreator/*
