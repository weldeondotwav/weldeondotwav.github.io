#!/usr/bin/bash

set -e
set -x

# ZS_DIR = the location of the zs source code on disk
ZS_DIR=/d/dev/zs

# build zs to incorporate our changes 
pushd $ZS_DIR || exit
echo "building zs..."
make build
echo "zs build complete"

popd || exit

# use the zs we just built to build and run the website
$ZS_DIR/myzs.exe build && \
$ZS_DIR/myzs.exe serve





