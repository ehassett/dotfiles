#!/bin/bash

# A simple script to display CPU and RAM usage as well as a batter icon.
# To view in tmux status bar, put this script in $PATH and add `#(sysinfo.sh)`
# somewhere in your .tmux.conf status options.

level=`cat /sys/class/power_supply/battery/capacity`

if [ $level -ge 75 ]; then
  battery="\u2589 \u2589 \u2589 \u2589 ]"
else 
  if [ $level -lt 75 ] && [ $level -ge 50 ]; then
    battery="\u2589 \u2589 \u2589 \u2001 ]"
  else
    if [ $level -lt 50 ] && [ $level -ge 25 ]; then
      battery=`echo -e "\u2589 \u2589 \u2001 \u2001 ]"`
    else
      battery="\u2589 \u2001 \u2001 \u2001 ]"
    fi
  fi
fi

totalMem=`cat /proc/meminfo | grep MemTotal | sed 's/[^0-9]*//g'`
freeMem=`cat /proc/meminfo | grep MemFree | sed 's/[^0-9]*//g'`
usedMem=$((totalMem-freeMem))
perMem=`echo "scale=4; ($usedMem/$totalMem)*100" | bc`
ram=`echo $(printf "%0.1f\n" $perMem)"%"`

usedCPU=`grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}'`
cpu=`echo $(printf "%0.1f\n" $usedCPU)"%"`

echo -e $ram" RAM | "$cpu" CPU | "$battery
