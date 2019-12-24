#!/usr/bin/env bash

### every exit != 0 fails the script
set -e

mkdir -p /tmp/qtcreator
cd /tmp/qtcreator
# see https://flames-of-code.netlify.com/blog/qt-on-docker/
wget http://download.qt.io/official_releases/qt/5.14/5.14.0/qt-opensource-linux-x64-5.14.0.run -nv
chmod +x qt-opensource-linux-x64-5.14.0.run
./qt-opensource-linux-x64-5.14.0.run  --script $INST_SCRIPTS/qt-noninteractive.qs --platform minimal --verbose

rm -rf /tmp/qtcreator/*
