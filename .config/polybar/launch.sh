#!/usr/bin/bash

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
monitors=$(polybar --list-monitors | cut -d":" -f1)

for m in $monitors; do
	export MONITOR=$m 
	polybar -c ~/.config/polybar/config.ini main &
done

# polybar -c ~/.config/polybar/config.ini main -r &
