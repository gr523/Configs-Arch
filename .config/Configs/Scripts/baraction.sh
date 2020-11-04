#!/bin/bash

mem() {
  mem=`free -h | awk '/Mem/ {printf "%s",$3}'`
  echo -e "+@fg=1;${mem/i}"
}

vol() {
    vol=`pamixer --get-volume-human`
    echo -e "+@fn=4;+@fg=5;+@fg=2;+@fn=0; $vol"
}

battery(){
  bat=`cat cat /sys/class/power_supply/BAT0/capacity`
  echo -e "+@fg=3;+@fn=3; +@fn=0; $bat%"
}

brightness(){
   bright=`light -G`
   bright=${bright%.*}
   echo -e "+@fg=4;+@fn=3; +@fn=0;$bright%"
}

SLEEP_SEC=3

while :; do
    echo "$(mem) $(vol)  $(brightness)  $(battery)"
	  sleep $SLEEP_SEC
done

#+@fg=1; +@fn=1;💻+@fn=0; $(cpu) +@fg=0; | +@fg=2; +@fn=1;💾+@fn=0; $(mem) +@fg=0; | +@fg=3; +@fn=1;💿+@fn=0; $(hdd) +@fg=0; | 
# 🔈




# cpu() {
#   read cpu a b c previdle rest < /proc/stat
#   prevtotal=$((a+b+c+previdle))
#   sleep 0.5
#   read cpu a b c idle rest < /proc/stat
#   total=$((a+b+c+idle))
#   cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
#   echo -e "CPU: $cpu%"
# }
