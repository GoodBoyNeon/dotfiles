#!/bin/bash

run() {
  if ! pgrep -f "$1"; then
    "$@" &
  fi
}

# lxsession
run lxsession

# Wallpaper engine
run nitrogen --restore

# Vim keybinds for arrow keys
run xmodmap ~/.Xmodmap

# Polybar
run ~/.config/polybar/launch.sh

