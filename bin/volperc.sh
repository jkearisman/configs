CARDNUM=0

MASTER=$(amixer -c ${CARDNUM} get Master | grep -m 1 -oE '[0-9]+%')
MASTER=${MASTER::-1}
HEADPHONE=$(amixer -c ${CARDNUM} get Headphone | grep '\[on\]')
SPEAKER=$(amixer -c ${CARDNUM} get Speaker+LO | grep '\[on\]')

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
