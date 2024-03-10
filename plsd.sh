#!/usr/bin/env bash

DETECT=6
SHUTDOWN=26

pinctrl set $DETECT ip

while [ 1 ]; do
  poll=$(pinctrl get $DETECT)
  poll=${poll#*| }
  poll=${poll% /*}

  if [ $poll = "lo" ]; then
    /bin/sleep 0.2
  elif [ $poll = "hi" ]; then
    pinctrl set $SHUTDOWN op dh
    /bin/sleep 3
    pinctrl set $SHUTDOWN op dl
  fi
done
