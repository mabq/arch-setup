#!/bin/sh

#
# AUTHOR: mabq
# DATE: Oct 24, 2022
# MODIFIED: Aug 14, 2024
#
# DESCRIPTION
# Connect/disconnect device
#
# USAGE
# hyprland keybindings
#

macaddress=$1

if bluetoothctl devices Connected | rg --quiet "$macaddress"; then
    # `bluetoothctl` command is provided by the `bluez-utils` package
    bluetoothctl disconnect "$macaddress"
else
    bluetoothctl connect "$macaddress"
fi
