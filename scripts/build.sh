#!/usr/bin/env bash
# Build theme

SCRIPT_DIR=$(dirname $0)
BUILD_DIR=$SCRIPT_DIR/../"_build"

if [ ! -d $BUILD_DIR ]; then
  meson setup $BUILD_DIR
else
  meson setup --wipe $BUILD_DIR
fi

meson $BUILD_DIR -Dprefix="$HOME/.local" --reconfigure
meson install -C $BUILD_DIR
