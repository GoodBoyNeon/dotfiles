#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    echo "$(date) Executing $1\n" >> ~/logs/log.txt
    "$@" >>~/logs/log.txt 2>&1 &
    echo "Return code: $?" >> ~/logs/log.txt
  else
    echo "$(date) Not Executing $1\n" >> ~/logs/log.txt
  fi
}
run "spotify"
