#!/bin/sh
sudo ip link set wlan0 up
sudo wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant/conf -D wext
sudo dhcpcd -A wlan0
