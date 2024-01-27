#!/bin/sh

#
# AUTHOR: mabq
# DATE: Oct 24, 2022
# MODIFIED: Nov 10, 2022
#
# DESCRIPTION
# Connect/disconnect sony WH-1000XM3 headset
#
# USAGE
# i3bar-WH1000XM3
#

macaddress="94:DB:56:18:82:5D"

if bluetoothctl devices Connected | rg --quiet "$macaddress"; then
    # `bluetoothctl` command is provided by the `bluez-utils` package
    bluetoothctl disconnect "$macaddress"
else
    bluetoothctl connect "$macaddress"
fi

