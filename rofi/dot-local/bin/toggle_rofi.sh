#!/usr/bin/env bash
if rofi_pid=$(pgrep "^rofi"); then
  kill $rofi_pid
elif [[ -n $1 ]]; then
  rofi -no-lazy-grab -show $1 -modes $1
else
  rofi -no-lazy-grab -show drun -modi drun,run,window,ssh
fi
