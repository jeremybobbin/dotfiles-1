#!/bin/sh
if [ $1 ]; then 
    ROUND_TO=$1; 
else 
    ROUND_TO=3; 
fi
BATTERY=/sys/class/power_supply/BAT0
power_remaining() {
    echo "`cat $BATTERY/energy_now` / `cat $BATTERY/energy_full`" | bc -l
}
round_to() {
    python -c "print(round($1, $2))"
}
power_rounded=$(round_to $(power_remaining) $ROUND_TO)
echo $power_rounded
