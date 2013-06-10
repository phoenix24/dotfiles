#!/bin/bash

# fix dual disply-monitor settings.
function fixmonitor() {
    xrandr --newmode  "1920x1080@60p" 148.50 1920 2008 2052 2200 1080 1084 1089 1125 +hsync +vsyn
    xrandr --addmode VGA1 1920x1080@60p
    xrandr --output VGA1 --mode 1920x1080@60p
}


