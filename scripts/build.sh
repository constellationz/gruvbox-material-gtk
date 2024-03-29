#!/usr/bin/env bash
# Build theme

BUILD_DIR="_build"

if [ ! -d $BUILD_DIR ]; then
  meson $BUILD_DIR
fi

meson $BUILD_DIR -Dprefix="$HOME/.local" --reconfigure
meson install -C $BUILD_DIR
