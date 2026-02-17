#!/bin/bash

# If idle for 15s, power down the output
swayidle -w timeout 15 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' &

# Lock screen immediatly
swaylock

# kill the last instance of swayidle so the timer doesnt keep running in background
pkill --newest swayidle
