#!/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the process have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
echo "---" | tee -a /tmp/polybar.log
polybar top -c /home/sharp/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar.log & disown
