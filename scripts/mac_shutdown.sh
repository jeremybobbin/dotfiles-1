#!/bin/sh
StartService() {
    echo "Started"
}

StopService() {
    echo "Stopped"
    sudo /Users/sabalaba/dotfiles/scripts/rebless
    exit 0
}

StartService
trap StopService SIGTERM
while true; do
    sleep 86400 &
    wait $!
done
