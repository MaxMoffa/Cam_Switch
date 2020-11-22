#!/bin/bash

# "Cam_Switch"
# By Massimo Moffa
# @maxmoffa

export SUDO_ASKPASS="home/$USER/.Cam_Switch/login_gui.sh"

cd /
if [[ $(lsmod | grep -o uvcvideo) ]]; then
	if sudo -A  modprobe -r uvcvideo; then
		notify-send --expire-time=2000 --hint=int:transient:1 'Webcam' 'Your webcam is disabled' -u normal -i ~/.Cam_Switch/cam_disable.png
	else
		notify-send --expire-time=2000 --hint=int:transient:1 'Webcam' 'There was an error' -u normal -i error
	fi
else
	if sudo -A  modprobe uvcvideo; then
		notify-send --expire-time=2000 --hint=int:transient:1 'Webcam' 'Your webcam is enabled' -u normal -i ~/.Cam_Switch/cam_enable.png
	else
		notify-send --expire-time=2000 --hint=int:transient:1 'Webcam' 'There was an error' -u normal -i error
	fi
fi
