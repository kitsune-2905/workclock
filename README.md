# workclock
bash automated workclock

## Beschreibung
Für das Homeoffice eine kleine automatisierte Zeitspeicherfunktion

Code example:


		#!/bin/bash
		x=0
		w=$(date)
		echo -e '\e[38;5;216mZeitaufzeichnung gestartet um '$w
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
		echo ''
		echo -e '\e[38;5;6m---------------------------------------------------'
		echo 'begonnen um '$w' beendet um '$v
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
					break
				fi
				if [[ $l = r ]]; then
				echo ''
				break
				fi
			done
		cat zeitspeicher
