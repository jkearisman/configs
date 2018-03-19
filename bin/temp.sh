TEMPC=$(sensors coretemp-isa-0000 | awk '/Package id 0/ {print $4}' | cut -b2- | bc )
if [[ ${TEMPC%.*} -ge 80 ]]
then
echo "<span color='#ff0000'>$TEMPC °C </span>"
elif [[ ${TEMPC%.*} -ge 50 ]]
then
echo "<span color='#ffff00'>$TEMPC °C </span>"
else
echo "<span color='#00ff00'>$TEMPC °C </span>"
fi


