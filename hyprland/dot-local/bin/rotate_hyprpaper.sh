#!/usr/bin/env bash

# This script will determine the number of active monitors,
# then select that number of random wallpapers from a list
# of directories, and use the appropriate method to update
# the wallpapers of all monitors.
# Built for hyprland, but I intend to keep bits modularized
# so that e.g. feh could be used instead of hyprpaper.

# Detect the monitor names so we can apply wallpapers later
# This version for detecting on hyprland, wrap in an if
# comparison to expand to other compositor/wms
monitors=(`hyprctl monitors | grep Monitor | awk '{print $2}'`)

monitor_count=$((${#monitors[@]}))
#echo ${monitor_count[@]}

walldir=()
walldir+=(/home/xaxas/Nextcloud/Photos/backgrounds)
walldir+=("/home/xaxas/Nextcloud/Photos/dank_papes")
walldir+=(/home/xaxas/mnt/pergamum/Pictures/backgrounds)
#echo ${walldir[@]}

# Create an array, length(num monitors), containing paths to images
papes=($(find ${walldir[@]} -type f -regex '[^ ]*' -name "*.jpg" -o -name "*.png" | sort -R | head -n $monitor_count))

# Break hyprpaper (for testing)
#papes=($(find ${walldir[@]} -type f -regex '[^ ]*' -name "*.jpg" -o -name "*.png" | sort -R))
#echo ${papes[@]}

# Release the previously loaded wallpapers from RAM
hyprctl hyprpaper unload all

# These two loops can be collapsed into a single loop, but
# there is a noticable delay between the two wallpapers being set
# while the second one is preloaded. Splitting the loops allows
# the preloading to happen first, then setting the wallpapers 
# happens perceptibly simultaneously.
i=0
while [[ $i -lt $monitor_count ]]
#while [[ $i -lt $((${#papes[@]})) ]]
do
  hyprctl hyprpaper preload ${papes[$i]}
  #hyprctl hyprpaper wallpaper "${monitors[$i]}, ${papes[$i]}"
  i=$(( i+1 ))
done

i=0
while [[ $i -lt $monitor_count ]]
do
  #hyprctl hyprpaper preload ${papes[$i]u
  hyprctl hyprpaper wallpaper "${monitors[$i]}, ${papes[$i]}"
  i=$(( i+1 ))
done

