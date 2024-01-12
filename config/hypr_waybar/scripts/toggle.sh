#!/bin/sh

#
# AUTHOR: mabq
# DATE: Dic 7, 2023
# MODIFIED: Dic 7, 2023
#
# DESCRIPTION
# Called via shortcut. Show/hide waybar bar.
#

process_id=$(pgrep --full --exact "waybar")

if [ "$process_id" -gt 0 ] ; then
    kill -9 "$process_id"
else
    waybar
fi
