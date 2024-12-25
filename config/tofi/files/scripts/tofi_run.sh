#!/bin/sh

#
# AUTHOR: mabq
# DATE: Jan 9, 2024
#
# DESCRIPTION
# Toggle open/clone tofi
#
# USAGE
# Window manager bind
#

if ! pgrep --full --exact "tofi-run" ; then
    tofi-run | xargs hyprctl dispatch exec --
else
    killall tofi-run
fi

