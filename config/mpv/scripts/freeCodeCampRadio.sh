#!/bin/sh

#
# AUTHOR: mabq
# DATE: Oct 21, 2022
# MODIFIED: Nov 10, 2022
#
# DESCRIPTION
# Toggle freecodecamp radio
#
# USAGE
# i3bar-radio
#
# Used in:
# - `$HOME/.config/i3status-rust/config.toml`
#

url="https://coderadio-admin.freecodecamp.org/radio/8010/radio.mp3"

# only kill the exact instance of mpv
process_id=$(pgrep --full --exact "mpv $url")

if [ "$process_id" -gt 0 ] ; then
    kill -9 "$process_id"
else
    mpv "$url"
fi

