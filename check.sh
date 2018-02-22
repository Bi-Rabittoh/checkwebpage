#!/bin/bash
#Before you run this script, make sure wget is installed and check https://github.com/mashlol/notify

#ADD NOTIFY KEY HERE
NOTIFYKEY=insertNotifyKeyHere

#EDIT LINK OF THE WEBPAGE TO CHECK
LINK=insertLinkHere

#YOU CAN EDIT THE INTERVAL, I SET IT TO 300s = 5 minutes
INTERVAL=300

#INSERT YOUR SUCCESS TEXT HERE, THIS WILL APPEAR IN YOUR NOTIFICATION
SUCCESS="The webpage was edited!"


notify -r $NOTIFYKEY
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

notify -t "$SUCCESS"
notify -u $NOTIFYKEY
