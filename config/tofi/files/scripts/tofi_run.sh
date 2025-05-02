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

# Check if tofi is running (the `> /dev/null` part is important!)
if pgrep --exact "tofi-run" > /dev/null; then
    pkill --exact "tofi-run"
    return 0
fi

tofi-run | xargs hyprctl dispatch exec --

