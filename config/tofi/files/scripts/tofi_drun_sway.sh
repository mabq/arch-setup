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

if ! pgrep --full --exact "tofi-drun" ; then
    tofi-drun | xargs swaymsg exec --
else
    killall tofi-drun
fi

