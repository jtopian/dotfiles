#!/bin/bash
/usr/bin/grep -e "bindsym" -e "bindcode" $HOME/.config/i3/config | /usr/bin/grep -v -e "^#" -e "^ " | /usr/bin/cut -d" " -f 2- | sed 's/\$mod/META/g' | less

#cat $HOME/.config/i3/config | awk '/bindsym/ && !/^$/ {gsub("\$mod","META",$2); print $0}' # | /usr/bin/cut -d" " -f 2-
