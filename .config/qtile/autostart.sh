#!/bin/sh
#   ___ _____ ___ _     _____   ____  _             _
#  / _ \_   _|_ _| |   | ____| / ___|| |_ __ _ _ __| |_
# | | | || |  | || |   |  _|   \___ \| __/ _` | '__| __|
# | |_| || |  | || |___| |___   ___) | || (_| | |  | |_
#  \__\_\|_| |___|_____|_____| |____/ \__\__,_|_|   \__|
#
# -----------------------------------------------------

# My screen resolution
# xrandr --rate 120

# For Display Port
# xrandr --output DP-1 --mode 1920x1080

# For Virtual Machine
# xrandr --output Virtual-1 --mode 1920x1080

# Set Keyboard Layout

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

run dunst
run picom

# Start picom

# Load notification service

# Restore wallpaper
run nitrogen --restore
run kitty
