#!/bin/bash
x=0
w=$(date '+%Y-%m-%d')
e=$(date '+%H:%M:%S')
echo -e '\e[38;5;216mZeitaufzeichnung gestartet am '$w' um '$e
echo -e 'zum Beenden die Taste \e[38;5;255ma\e[38;5;216m drücken\e[38;5;255m'

while true
	do
		read -t 1 -n 1 k <&1
		x=$((x + 1))
		if [[ $k = a ]]; then
			echo ''
			break
		fi
	done
y=$(($x%3600))
z=$(($x/3600))
q=$((y/60))
v=$(date)
f=$(date '+%H:%M:%S')
echo ''
echo -e '\e[38;5;6m---------------------------------------------------'
echo 'begonnen am '$w' um '$e' beendet um '$f
echo -e '\e[38;5;12m'$z' Stunden, '$q' Minuten gearbeitet\e[38;5;255m'
echo ''
echo -e '\e[38;5;216mzum Speichern Taste \e[38;5;255ms\e[38;5;216m drücken, zum Abbrechen drücke Taste \e[38;5;255mr'
while true
	do
		read -t 1 -n 1 l <&1
		if [[ $l = s ]]; then
			echo ''
			echo -e '\e[38;5;6m---------------------------------------------------' >> zeitspeicher
			echo 'begonnen um '$w' beendet um '$v >> zeitspeicher
			echo -e '\e[38;5;12m'$z' Stunden, '$q' Minuten gearbeitet\e[38;5;255m' >> zeitspeicher
			echo $w' , '$e' ,'$f' , '$z':'$q >> zeittable.csv
			break
		fi
		if [[ $l = r ]]; then
			echo ''
			break
		fi
	done
cat zeitspeicher
cat zeittable.csv
