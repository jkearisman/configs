

MASTER=$(amixer -c 0 get Master | grep -m 1 -oE '[0-9]+%')
MASTER=${MASTER::-1}
HEADPHONE=$(amixer -c 0 get Headphone | grep '\[on\]')
SPEAKER=$(amixer -c 0 get Speaker+LO | grep '\[on\]')

if [[ -n $HEADPHONE ]]
then
	echo "${MASTER}% 🎧"
elif [[ ! -n $SPEAKER ]]
then
	echo "<span color='yellow'>${MASTER}% 🔇</span>"
elif [[ $MASTER -gt 50 ]]
then
	echo "${MASTER}% 🔊"
elif [[ $MASTER -gt 25 ]]
then
	echo "${MASTER}% 🔉"
else
	echo "${MASTER}% 🔈"
fi
