#!/bin/bash
x=0
startdate=$(date '+%Y-%m-%d')
starttime=$(date '+%H:%M:%S')
echo -e '\e[38;5;216mZeitaufzeichnung gestartet am '$startdate' um '$starttime
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
modminuten=$(($x%3600))
stunden=$(($x/3600))
minutenunformated=$((modminuten/60))
minuten=$(printf "%02d" $minutenunformated)
enddate=$(date '+%Y-%m-%d')
endtime=$(date '+%H:%M:%S')
echo ''
echo -e '\e[38;5;6m---------------------------------------------------'
echo 'begonnen am '$startdate' um '$starttime' beendet um '$endtime
echo -e '\e[38;5;12m'$stunden' Stunden, '$minuten' Minuten gearbeitet\e[38;5;255m'
echo ""
echo "willst du eine Taskbeschreibung hinzufügen drücke [y/n] ?"
while true
	do
		read -s -N 1 -t 1 m
		if [[ $m = 'y' ]]; then
			read -p "Task: " task
			break
		elif [[ $m = 'n' ]]; then
			echo "n gedrück, kein Task hinzugefügt"
			break
		fi
	done
echo ""
echo -e "\e[38;5;255mTask \e[38;5;6m"$task"\e[38;5;255m für deine Arbeit hinzugefügt"
echo ''
echo -e '\e[38;5;216mzum Speichern Taste \e[38;5;255ms\e[38;5;216m drücken, zum Abbrechen drücke Taste \e[38;5;255mr'
echo ""
while true
	do

		read -t 1 -n 1 l <&1
		if [[ $l = s ]]; then
			echo "Prüfung ob Speicherdatei vorhanden"
			if test -f "zeittable.csv"; then
				echo "Zeittable.csv existiert"
			else
				echo "Datum,Startzeit,Endzeit,Dauer,Task" > zeittable.csv
				echo "Datei Zeittable.csv wurde erstellt"
			fi
			echo ""
			echo "Programm wird fortgeführt"
			echo ""
			echo ''
			echo -e '\e[38;5;6m---------------------------------------------------' >> zeitspeicher
			echo 'begonnen am '$startdate' um '$starttime' beendet um '$endtime >> zeitspeicher
			echo -e '\e[38;5;12m'$stunden' Stunden, '$minuten' Minuten gearbeitet\e[38;5;255m' >> zeitspeicher
			echo $startdate','$starttime','$endtime','$stunden':'$minuten','$task >> zeittable.csv
			break
		fi
		if [[ $l = r ]]; then
			echo ''
			break
		fi
	done
cat zeitspeicher
cat zeittable.csv
