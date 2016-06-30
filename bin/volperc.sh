
VOLNUM=$(amixer -c 1 get Master | grep -oE '[0-9]+%' | head -n 1)
if [ -n "$(amixer -c 1 get Master | grep 'off')" ]
then
VOLNUM="$VOLNUM [M]"
fi

echo "$VOLNUM"

