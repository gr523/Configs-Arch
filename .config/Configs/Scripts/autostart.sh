#!/bin/sh
#xss-lock -- dm-tool switch-to-greeter &
picom &
nitrogen --restore & 
xinput float 17 &
/usr/bin/lxpolkit & 
xdotool key Alt_L+3 && xdotool key Super_L+b && xdotool key Alt_L+1 
