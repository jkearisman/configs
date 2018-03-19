
CARDNUM=0
MASTER=$(amixer -c ${CARDNUM} get Master | grep -m 1 -oE '[0-9]+%')
MASTER=${MASTER::-1}
HEADPHONE=$(amixer -c ${CARDNUM} get Headphone | grep '\[on\]')

if [[ -n $HEADPHONE ]]
then
	echo "${MASTER}% 🎧"
else
	echo "<span color='yellow'>${MASTER}% 🔇</span>"
fi
