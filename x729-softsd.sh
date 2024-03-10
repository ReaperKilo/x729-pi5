#!/bin/bash

BUTTON=26

pinctrl set $BUTTON op dh

SLEEP=${1:-4}

re='^[0-9\.]+$'
if ! [[ $SLEEP =~ $re ]] ; then
   echo "error: sleep time not a number" >&2; exit 1
fi

echo "Your device will shutting down in 4 seconds..."
/bin/sleep $SLEEP

#restore GPIO 26
pinctrl set $BUTTON dl