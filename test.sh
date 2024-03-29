#!/usr/bin/env bash
# Quickly test theme

./build.sh && gsettings set org.gnome.desktop.interface gtk-theme Adwaita && sleep 0.5 && gsettings set org.gnome.desktop.interface gtk-theme Materia-dark-compact
