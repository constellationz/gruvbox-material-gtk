#!/usr/bin/env bash
# Build theme

if [ ! -d _build ]; then
  meson _build
fi

meson _build -Dprefix="$HOME/.local" -Dcolors=default,dark -Dsizes=compact --reconfigure && meson install -C _build
