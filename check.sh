#!/bin/bash
#Before you run this script, make sure wget is installed and check https://github.com/mashlol/notify

#ADD NOTIFY KEY HERE
notify -r insertkeyhere

#EDIT LINK OF THE WEBPAGE TO CHECK
LINK=insertlinkhere

#YOU CAN EDIT THE INTERVAL, I SET IT TO 300s = 5 minutes
INTERVAL=300


wget -O temp $LINK --quiet
SIZE1=$(stat -c%s "temp")
rm temp
SIZE2=$SIZE1
I=0
while [ "$SIZE1" -eq "$SIZE2" ]; do
	sleep $INTERVAL
	echo $I
	wget -O temp $LINK --quiet
	SIZE2=$(stat -c%s "temp")
	rm temp
	let I=I+1
done

notify -t "Sono usciti i risultati di Analisi II!"
