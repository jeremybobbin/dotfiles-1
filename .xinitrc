# use left pointer instead of x cursor
xsetroot -cursor_name left_ptr
# set the kb layout to colemak
# setxkbmap -layout colemak
# start
exec xmonad
xrandr --output DVI-I-3 --rotate left --auto --right-of DVI-I-2 --auto
