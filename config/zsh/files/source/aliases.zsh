# Add options to core utils:
# alias chgrp='chgrp --preserve-root'
# alias chmod='chmod -c --preserve-root'
# alias chown='chown -c --preserve-root'
# alias cp='cp -iv'
alias la='eza -al'
# alias ln='ln -iv'
alias mkdir='mkdir -p'
# alias mv='mv -iv'
# alias rm='rm -iv --preserve-root'
# alias tmux='tmux -2' # force tmux to assume that the terminal support 256 colors https://wiki.archlinux.org/title/tmux#256_colors


# Shortcuts/renames:
alias cpuinfo='bat /proc/cpuinfo'
alias drivers='lspci -k'
alias e='nvim .'
alias fat32='sudo mkfs.fat -F 32' # format external disk to work on any OS
alias fontname="fc-query -f '%{family[0]}\n'" # pass the font path as argument
alias fonts='fc-list : family | sort | uniq | fzf'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gp='git push'
alias gpuinfo='lspci | grep -E "VGA|3D"'
alias gs='git status'
alias h='history -i 1'
alias keycodes="xev | awk -F '[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias logout='loginctl terminate-user $USER'
alias mdserve='mdbook serve --open'
alias mousecodes='xev -event button | grep button'
alias path='echo $PATH | tr ":" "\n"'
alias psbyuser='ps --no-headers -Leo user | sort | uniq --count'
alias reboot='systemctl reboot'
alias restart-spotifyd='systemctl --user restart spotifyd.service'
alias sha256='shasum -a 256'
alias shutdown='systemctl poweroff'
alias suspend='swaylock; systemctl suspend'
alias ta='tmux attach'
alias toen='trans es:en'
alias toes='trans en:es'
alias trash='trash-put'
alias tree='eza --tree'
alias wifi='nmtui'


# Requests:
alias extip='curl icanhazip.com'
alias extipjson='curl https://ipapi.co/json/'
# alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias weather='curl wttr.in'


# Safety nets:
alias fsck='echo "Never use file system repair software such as fsck directly on an encrypted volume, or it will destroy any means to recover the key used to decrypt your files. Such tools must be used on the decrypted (opened) device instead"'

