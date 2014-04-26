#!/bin/bash
MAX_KBD=255
MAX_MON=1808
MAX_VOL=100
MIN_ALL=0
INCREMENT=8
BACKLIGHT_CUR=/sys/class/backlight/intel_backlight/actual_brightness
BACKLIGHT_VAL=/sys/class/backlight/intel_backlight/brightness
KBD_CUR=/sys/class/leds/smc\:\:kbd_backlight/brightness
KBD_VAL=/sys/class/leds/smc\:\:kbd_backlight/brightness

cmd=$1

max() {
    echo $1 $2 | awk '{ if ($1 > $2) { print $1 } else { print $2 } }'
}

min() {
    echo $1 $2 | awk '{ if ($1 < $2) { print $1 } else { print $2 } }'
}

floor0() {
    max 0 $1
}

ceil() {
    min $1 $2
}

if ! [[ $UID == 0 ]]
then
    echo 1>&2 requires root access
    exit 1
fi

case "$cmd" in
    mon-dec)
        CURRENT=$(cat $BACKLIGHT_CUR)
        max $MIN_ALL $(($CURRENT - $INCREMENT)) > $BACKLIGHT_VAL
        ;;
    mon-inc)
        CURRENT=$(cat $BACKLIGHT_CUR)
        min $MAX_MON $(($CURRENT + $INCREMENT)) > $BACKLIGHT_VAL
        ;;
    kbd-dec)
        CURRENT=$(cat $KBD_CUR)
        max $MIN_ALL $(($CURRENT - $INCREMENT)) > $KBD_VAL
        ;;
    kbd-inc)
        CURRENT=$(cat $KBD_CUR)
        min $MAX_KBD $(($CURRENT + $INCREMENT)) > $KBD_VAL
        ;;
esac
