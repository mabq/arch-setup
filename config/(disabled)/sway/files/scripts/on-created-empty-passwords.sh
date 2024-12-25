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

swaymsg "workspace passwords"
if (! pgrep -x keepassxc > /dev/null); then
    swaymsg "exec keepassxc"
fi
