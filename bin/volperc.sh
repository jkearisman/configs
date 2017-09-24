CARDNUM=0

VOLMUTE=$(amixer -c ${CARDNUM} get Master | grep 'off')

MASTER=$(amixer -c ${CARDNUM} get Master | grep -oE '[0-9]+%' | head -n 1)
HEADPHONE=$(amixer -c ${CARDNUM} get Headphone | grep 'off')
if [[ -n $VOLMUTE ]]
then
	echo "<span color='yellow'> $MASTER</span>"
elif [[ -n $HEADPHONE ]]
then
	echo " $MASTER"
else
	echo " $MASTER"
fi

