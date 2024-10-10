#!/bin/sh

#
# AUTHOR: mabq
# MODIFIED: Aug 27, 2024
#
# DESCRIPTION
# Called via shortcut.
#
# USAGE
# compositor keybindings
#

swaymsg "workspace music"
if (! pgrep -x spotify > /dev/null); then
    swaymsg "exec spotify-launcher"
fi
