#!/bin/bash

xrandr --output HDMI-A-0 --set TearFree on
qdbus org.kde.KWin /Compositor resume
