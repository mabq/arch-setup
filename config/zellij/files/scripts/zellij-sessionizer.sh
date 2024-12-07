#!/bin/sh

# ------------------------------------------------------------------------------
#
# Author: adaptation from theprimeagen tmux-sessionizer
#   original script: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
#   theprimeagen developer workflow: https://www.youtube.com/watch?v=bdumjiHabhQ&t=208s
#
# Date: Feb 10, 2023
#   Modified: Aug 07, 2023
#
# Description:
#   Simplify the creation of tmux sessions. Both, zsh and neovim, have mappings pointing to this script (Ctrl-f)
#   The original script doesn't automatically attach when creating the first session
#
# Required packages:
#   fd, fzf
#
# ------------------------------------------------------------------------------

# Add any directories you want (use `$HOME` instead of `~`)
directories="$HOME/ $HOME/projects/"

# Use the directory passed as argument or fuzzy find (if no argument is provided)
if [[ $# -eq 1 ]]; then
  working_directory=$1
else
  working_directory=$(fd --hidden --no-ignore --exact-depth 1 --type directory . $directories | sk)
fi

if [[ -z $working_directory ]]; then
  exit 0
fi

# Use the directory name as the session name (session names cannot include dots, replace them with `_`)
# session_name=$(basename "$working_directory" | tr . _)
session_name=$(basename "$working_directory")

# Create the session (if necessary) in detached mode
if ! zellij list-sessions --short | rg --fixed-strings --quiet --line-regexp "$session_name"; then
  cd $working_directory
  zellij attach --create $session_name
fi

# zellij attach $session_name
