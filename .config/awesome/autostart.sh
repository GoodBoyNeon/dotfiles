#!/bin/bash

run() {
  if ! pgrep -f "$1"; then
    "$@" &
  fi
}

# lxsession
run lxsession

# Compositor
# run picom --animations --backend glx --animation-for-open-window fly-in -b

# Wallpaper engine
run nitrogen --restore

# Network Manager applet
run nm-applet

# Redshift
run redshift

# Vim keybinds for arrow keys
run xmodmap ~/.Xmodmap

# Polybar
run ~/.config/polybar/launch.sh

