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


# Check if hyprpicker is running (the `> /dev/null` part is important!)
if pgrep --exact "hyprpicker" > /dev/null; then
    # Kill hyprpicker if running
    pkill --exact "hyprpicker"
    return 0
fi

# Use the color format passed as argument (hyprland keybinds) or hex if none is passed
if [ $# -eq 1 ]; then
    format=$1
else
    format="hex"
fi

picked_color=$(hyprpicker --no-fancy --render-inactive --no-fractional)

if [ -n "$picked_color" ]; then
    wl-copy "$(pastel format "$format" "$picked_color")"
fi
