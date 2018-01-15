#!/usr/bin/bash

VOL=$(amixer get Master | grep -o 'off')

if [ -n "$VOL" ]
then
	amixer set Master unmute
	amixer set Headphone unmute
	amixer set Speaker unmute
else
	amixer set Master mute
	amixer set Headphone mute
	amixer set Speaker mute
fi

#exec $HOME/bin/updateXroot.sh
