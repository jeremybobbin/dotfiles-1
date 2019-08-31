#!/bin/sh
if [ $1 ]; then 
    ROUND_TO=$1; 
else 
    ROUND_TO=3; 
fi
BATTERY=/sys/class/power_supply/BAT0


power_remaining() {
	echo "16 k `cat $BATTERY/energy_{now,full}` / p" | dc
}

round_to() {
	printf "%1.$2f" $1
}

power_rounded=$(round_to $(power_remaining) $ROUND_TO)

echo $power_rounded
