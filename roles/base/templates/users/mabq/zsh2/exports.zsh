# XDG Base Directory
#   Only XDG_RUNTIME_DIR is set by default through pam_systemd(8). It is up to the user to explicitly define the other variables according to the specification.
#   https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories
export XDG_CONFIG_HOME="$HOME/.config"    # $HOME is set in `/etc/passwd` for each user
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# defaults
export BROWSER="{{ browser }}"
export EDITOR="{{ editor }}"
export GTK_THEME="Adwaita:dark"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"    # https://wiki.archlinux.org/title/Color_output_in_console#Using_less
export PAGER="less -R --use-color -Dd+r -Du+b"
export TERM="{{ terminal }}"
export TERMINAL="{{ terminal }}"
export VISUAL="{{ editor }}"
# export GPG_TTY="${TTY:-$(tty)}"
# export VOLTA_HOME="$XDG_CONFIG_HOME/.volta" # The hassle-free JavaScript Tools Manager

# history options (no need to export, child processes don't need these variables)
HISTSIZE=10000
SAVEHIST="${HISTSIZE}"
HISTFILE=~/.cache/zsh/history  # avoid including the history file on the dotfiles repo

# edit the PATH variable (use functions to avoid duplicates)
appendToPATH_fn "$HOME/.local/bin"
# appendToPATH_fn "$HOME/.cargo/bin"
#prependToPATH_fn "$HOME/.volta/bin"

