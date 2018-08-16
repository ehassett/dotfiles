#!/bin/bash

# A simple script to display a battery icon based on percentage.
# To view in tmux status bar, put this script in $PATH and add `#(power.sh)`
# somewhere in your tmux.conf status options.

level=`cat /sys/class/power_supply/battery/capacity`

if [ $level -ge 75 ]; then
  echo -e "\u2589 \u2589 \u2589 \u2589 ]"
else 
  if [ $level -lt 75 ] && [ $level -ge 50 ]; then
    echo -e "\u2589 \u2589 \u2589   ]"
  else
    if [ $level -lt 50 ] && [ $level -ge 25 ]; then
      echo -e "\u2589 \u2589     ]"
    else
      echo -e "\u2589       ]"
    fi
  fi
fi
