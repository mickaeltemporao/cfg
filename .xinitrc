#!/bin/sh

# Launch autostart script if present
if [ -x ~/.config/dwm/autostart.sh ]; then
    ~/.config/dwm/autostart.sh &
fi

exec dwm


