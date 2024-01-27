# Edit the PATH variable:
#   (the `appendToPATH_fn` functions avoids duplicate entries in $PATH)
#   (`~/.local/bin` contains the custom scripts that are called from the terminal)
appendToPATH_fn "$HOME/.local/bin"
# appendToPATH_fn "$HOME/go/bin"
# appendToPATH_fn "$HOME/.cargo/bin"
#prependToPATH_fn "$HOME/.volta/bin"


# History options:
#   (no need to export, child processes don't need these variables)
HISTSIZE=10000
SAVEHIST="${HISTSIZE}"
HISTFILE=~/.cache/zsh/history  # be careful not to include this file on any git repo


# XDG Base Directory:
#   Only XDG_RUNTIME_DIR is set by default through pam_systemd(8). It is up to the user to explicitly define the other variables according to the specification.
#   https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories
export XDG_CONFIG_HOME="$HOME/.config"  # $HOME value is taken from `/etc/passwd`
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"


# SSH-agent:
#   (required for the ssh-agent to work across terminals)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"  # https://wiki.archlinux.org/title/SSH_keys#Start_ssh-agent_with_systemd_user


# Defaults:
#   These variables define default applications when executing commands from the terminal.
#   Do not set the `TERM` variable!, it is set by each terminal emulator.
export BROWSER="brave"  # when opening links
export VISUAL="nvim"  # when opening a GUI editor (nnn `-e` option will respect this variable)
export EDITOR="nvim"  # when opening a terminal editor
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"  # https://wiki.archlinux.org/title/Color_output_in_console#Using_less
export PAGER="less -R --use-color -Dd+r -Du+b"
# export GPG_TTY="${TTY:-$(tty)}"
# export VOLTA_HOME="$XDG_CONFIG_HOME/.volta" # The hassle-free JavaScript Tools Manager


# Colors:
export GTK_THEME="Adwaita:dark"

    # Catpucchin colors for fzf (https://github.com/catppuccin/fzf)
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
