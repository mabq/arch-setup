#!/bin/sh

#
# AUTHOR: mabq
# MODIFIED: Aug 15, 2024
#
# DESCRIPTION
# Called via shortcut. Show/hide waybar bar by name
#
# USAGE
# hyprland keybindings
#

bar_name=$1

process_id=$(pgrep --full --exact "waybar --config $HOME/.config/waybar/$bar_name.jsonc")

if [ "$process_id" -gt 0 ] ; then
    kill -9 "$process_id"
else
    waybar --config "$HOME/.config/waybar/$bar_name.jsonc"
fi
