#!/usr/local/bin/bash

function zoomfix {
    xcompmgr -c -l0 -t0 -r0 -o.00
}

function brightness {
    xrandr --output $(xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --brightness $1
}

function bluetooth-powerbeats-pro {
    bluetoothctl connect A4:83:E7:E6:48:65
}
