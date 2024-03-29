#!/usr/bin/env bash
# Quickly test theme

SCRIPT_DIR=$(dirname $0)

$SCRIPT_DIR/build.sh
gsettings set org.gnome.desktop.interface gtk-theme Adwaita 
sleep 0.1
gsettings set org.gnome.desktop.interface gtk-theme Materia-dark-compact
