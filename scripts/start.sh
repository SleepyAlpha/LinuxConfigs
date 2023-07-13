#!/bin/bash

xrandr --output HDMI-A-0 --set TearFree off
qdbus org.kde.KWin /Compositor suspend
