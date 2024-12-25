#!/bin/sh

#
# AUTHOR: mabq
# MODIFIED: Aug 18, 2024
#
# DESCRIPTION
# Called via shortcut.
#
# USAGE
# hyprland keybindings
#

process_id=$(pgrep "hyprpicker")

if [ "$process_id" -gt 0 ] ; then
    kill -9 "$process_id"
else
    hyprpicker --format=hex --autocopy --no-fancy --render-inactive
fi
