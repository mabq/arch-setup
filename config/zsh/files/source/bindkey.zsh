# Use vi mode instead of emacs (default)
bindkey -v

# Zsh bug fix (https://github.com/spaceship-prompt/spaceship-prompt/issues/91#issuecomment-327996599)
bindkey '^?' backward-delete-char 

# Launch tmux-sessionizer with Ctrl-f
bindkey -s '^f' "$HOME/.config/tmux/scripts/tmux-sessionizer.sh\n"

# Move to start/end of line quickly (without entering vim mode)
#   (disabled to use those keybindings with Harpoon)
# bindkey '^h' beginning-of-line
# bindkey '^l' end-of-line

# History search up/down arrows (requires zsh-history-substring-search plugin)
bindkey '^[[A' history-substring-search-up    # up arrow
bindkey '^[[B' history-substring-search-down  # donw arrow

