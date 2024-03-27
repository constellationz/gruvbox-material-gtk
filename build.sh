#!/usr/bin/env bash
meson _build -Dprefix="$HOME/.local" -Dcolors=default,dark -Dsizes=compact --reconfigure && meson install -C _build
