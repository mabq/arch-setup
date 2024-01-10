#!/bin/sh

#
# AUTHOR: mabq
# DATE: Dec 29, 2023
# MODIFIED: Dec 29, 2023
#
# DESCRIPTION
# Open brave or go to brave
#
# USAGE
# Window manager bind
#

hyprctl dispatch workspace 2
if ! pgrep --full --exact "/opt/brave-bin/brave" ; then
    brave
fi

