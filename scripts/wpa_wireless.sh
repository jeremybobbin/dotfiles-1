#!/bin/sh
sudo wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant/conf -D wext
