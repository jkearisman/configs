LAYOUT=$(setxkbmap -query | awk '/layout/ {print $2}' | cut -b-2)
VARIANT=$(setxkbmap -query | awk '/variant/ {print $2}' | cut -b-2)

if [[ -n $VARIANT ]]
then
	echo  $VARIANT
else
	echo  $LAYOUT
fi

