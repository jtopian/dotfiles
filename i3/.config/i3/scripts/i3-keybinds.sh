#!/bin/bash
/usr/bin/grep bindsym $HOME/.config/i3/config | /usr/bin/grep -v -e "^#" -e "^ " | /usr/bin/cut -d" " -f 2- | less
