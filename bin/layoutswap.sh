#!/bin/bash

if [[ -n $(setxkbmap -query | grep dvorak) ]]
then
	setxkbmap us
else
	setxkbmap dvorak
fi

