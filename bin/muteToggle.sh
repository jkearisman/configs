#!/usr/bin/bash

VOL=$(amixer -c 1 get Master | grep -o 'off')

if [ -n "$VOL" ]
then
	amixer -c 1 set Master unmute
	amixer -c 1 set Headphone unmute
	amixer -c 1 set Speaker unmute
else
	amixer -c 1 set Master mute
	amixer -c 1 set Headphone mute
	amixer -c 1 set Speaker mute
fi

#exec $HOME/bin/updateXroot.sh
