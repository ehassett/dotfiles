#!/bin/zsh

# A simple script to display a battery icon based on percentage.
# To view in tmux status bar, put this script in $PATH and add `#(tmux_battery.sh)`
# somewhere in your tmux.conf status options.

output() {
  if [ $level -ge 75 ]; then
    echo -e "$1$1$1$1]"
  else
    if [ $level -lt 75 ] && [ $level -ge 50 ]; then
      echo -e "$1$1$1  ]"
    else
      if [ $level -lt 50 ] && [ $level -ge 25 ]; then
        echo -e "$1$1    ]"
      else
        echo -e "$1      ]"
      fi
    fi
  fi
}

OS=`uname -s`

if [ "$OS" = "Darwin" ]; then
  level=`pmset -g batt | grep -o "[0-9]*%" | tr -d '%'`
  output "\u2588\u258D"
else
  level=`cat /sys/class/power_supply/battery/capacity`
  output "\u2589 "
fi
