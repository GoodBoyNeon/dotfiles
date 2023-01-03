#!/bin/bash

run() {
  if ! pgrep -f "$1"; then
    "$@" &
  fi
}

# lxsession
run lxsession

# Polybar
run ~/.config/polybar/launch.sh
# Compositor
run picom --animations --backend glx --animation-for-open-window fly-in -b

# Wallpaper engine
run nitrogen --restore

# Network Manager applet
run nm-applet

# Nightlight
run redshift-gtk

# Vim keybinds for arrow keys
run xmodmap ~/.Xmodmap
