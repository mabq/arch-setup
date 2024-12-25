#!/bin/sh

#
# AUTHOR: mabq
# DATE: Oct 24, 2022
# MODIFIED: Nov 10, 2022
#
# DESCRIPTION
# Connect/disconnect sony WH-1000XM3 headset
#
# USAGE
# i3bar-WH1000XM3
#

for family in serif sans-serif monospace Arial Helvetica Verdana "Times New Roman" "Courier New"; do
  echo -n "$family: "
  fc-match "$family"
done
