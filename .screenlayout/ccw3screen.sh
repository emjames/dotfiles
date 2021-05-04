#!/bin/sh
xrandr --output eDP1 --primary --mode 1920x1080 --pos 1080x1369 --rotate normal --output DP1 --mode 1920x1080 --pos 0x0 --rotate left --output DP2 --off --output HDMI1 --off --output HDMI2 --mode 1920x1080 --pos 1080x289 --rotate normal --output VIRTUAL1 --off
i3-msg 'workspace "13:O"; move workspace to output DP1'
i3-msg 'workspace "3:3"; move workspace to output DP1'
i3-msg 'workspace "2:2"; move workspace to output HDMI2'

