# use vi mode instead of emacs (default)
bindkey -v

# zsh bug fix (https://github.com/spaceship-prompt/spaceship-prompt/issues/91#issuecomment-327996599)
bindkey '^?' backward-delete-char 

# launch tmux-sessionizer with Ctrl-f
bindkey -s '^f' "tmux-sessionizer\n"

# move to start/end of line quickly (without entering vim mode)
bindkey '^h' beginning-of-line
bindkey '^l' end-of-line

# history search up/down arrows (requires zsh-history-substring-search plugin)
bindkey '^[[A' history-substring-search-up    # up arrow
bindkey '^[[B' history-substring-search-down  # donw arrow

