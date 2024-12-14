#!/usr/bin/bash

# Author: https://github.com/Peeeaje/zellij-switch-session/blob/main/scripts/zellij-sessionizer.sh

# Add any directories you want (use `$HOME` instead of `~`)
directories="$HOME/ $HOME/projects/"

# Use the directory passed as argument or fuzzy find (if no argument is provided)
if [[ $# -eq 1 ]]; then
  selected_path=$1
else
  selected_path=$(fd --hidden --no-ignore --exact-depth 1 --type directory . $directories | sk)
fi

# If no directory was selected, exit the script
if [[ -z $selected_path ]]; then
  exit 0
fi

# Get the name of the selected directory, replacing "." with "_"
session_name=$(basename "$selected_path" | tr . _)

if [[ -z $ZELLIJ ]]; then
  cd $selected_path
  zellij attach $session_name -c
  exit 0
else
  $HOME/projects/arch-setup/config/zellij/files/scripts/zellij-switch-session.sh $session_name $selected_path
  exit 0
fi
