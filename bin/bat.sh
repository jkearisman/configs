STAT=$(cat /sys/class/power_supply/BAT0/status)
CAP=$(cat /sys/class/power_supply/BAT0/capacity)

ICON=!
COLOR="'white'"

if [ $STAT == 'Full' ]
then
	COLOR="'#00ff00'"
	ICON=
elif [ $STAT == 'Charging' ]
then
	COLOR="'orange'"
	ICON=
elif [[ $CAP -ge 90 ]]
then
	COLOR="'#00ff00'"
	ICON=
elif [[ $CAP -ge 75 ]]
then
	COLOR="'#00ff00'"
	ICON=
elif [[ $CAP -ge 50 ]]
then
	COLOR="'#ffff00'"
	ICON=
elif [[ $CAP -ge 20 ]]
then
	COLOR="'#ffff00'"
	ICON=
else
	COLOR="'#ff0000'"
	ICON=
fi

echo "<span color=$COLOR>${CAP}% ${ICON}</span>"
