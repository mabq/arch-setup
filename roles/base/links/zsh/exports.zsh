# Edit the PATH variable ---
#   (use functions to avoid duplicates)
appendToPATH_fn "$HOME/go/bin"
appendToPATH_fn "$HOME/.local/bin"
# appendToPATH_fn "$HOME/.cargo/bin"
#prependToPATH_fn "$HOME/.volta/bin"

# History options ---
#   (no need to export, child processes don't need these variables)
HISTSIZE=10000
SAVEHIST="${HISTSIZE}"
HISTFILE=~/.cache/zsh/history  # be carefull not to include this file on any git repo

# XDG Base Directory ---
#   Only XDG_RUNTIME_DIR is set by default through pam_systemd(8). It is up to the user to explicitly define the other variables according to the specification.
#   https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories
export XDG_CONFIG_HOME="$HOME/.config"  # $HOME value is taken from `/etc/passwd`
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# SSH-agent ---
#   (required for the ssh-agent to work accross terminals)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"  # https://wiki.archlinux.org/title/SSH_keys#Start_ssh-agent_with_systemd_user

# Defaults ---
#   These variables define default applications when executing commands from the terminal
export BROWSER="brave"  # when openning links
export VISUAL="nvim"  # when openning a GUI editor
export EDITOR="nvim"  # when openning a terminal editor
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"  # https://wiki.archlinux.org/title/Color_output_in_console#Using_less
export PAGER="less -R --use-color -Dd+r -Du+b"
# export TERM="alacritty"  # (must be set by the terminal emulator)
# export GPG_TTY="${TTY:-$(tty)}"
# export VOLTA_HOME="$XDG_CONFIG_HOME/.volta" # The hassle-free JavaScript Tools Manager

export GTK_THEME="Adwaita:dark"

