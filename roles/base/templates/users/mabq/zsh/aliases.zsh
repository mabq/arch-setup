# add options to core utils
alias chgrp='chgrp --preserve-root'
alias chmod='chmod -c --preserve-root'
alias chown='chown -c --preserve-root'
alias cp='cp -iv'
alias la='exa -al'
alias ln='ln -iv'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -iv --preserve-root'
# alias tmux='tmux -2' # force tmux to assume that the terminal support 256 colors https://wiki.archlinux.org/title/tmux#256_colors

# renames
alias font_preview='fontpreview-ueberzug'
alias lf='lfcd_fn'    # calls custom function to automatically change to last directory on quit
alias j='joshuto'
alias pango='pango-list'
alias trash='trash-put'
alias vi='{{ editor }}'
alias vim='{{ editor }}'
alias wifi='nmtui'
alias wifi_cli='iwctl'
alias wifi_info='wavemon'

# shortcuts
alias cpu_info='bat /proc/cpuinfo'
alias e='{{ editor }} .'
alias fat32='sudo mkfs.fat -F 32' # format external disk to work on any OS
alias fonts='fc-list : family | sort | uniq | fzf'
alias ga='git add'
alias gc='git commit'
alias gca='git commmit --amend'
alias gp='git push'
alias gs='git status'
alias h='history -i 1'
alias hw_drivers='lspci -k'
alias key_codes="xev | awk -F '[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias mdserve='mdbook serve --open'
alias mouse_codes='xev -event button | grep button'
alias path='echo $PATH | tr ":" "\n"'
alias psbyuser='ps --no-headers -Leo user | sort | uniq --count'
alias setup='cd ~/projects/ansible-setup/ && ga . && gc -m "all" ; gp && sleep 3 && sudo ansible-pull -U https://github.com/mabq/ansible-setup --vault-password-file ~/.vault_key'
alias sha256='shasum -a 256'
alias ta='tmux attach'
alias toen='trans es:en'
alias toes='trans en:es'
alias tree='exa --tree --level=3'

# requests
alias extip='curl icanhazip.com'
alias extip_json='curl https://ipapi.co/json/'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias weather='curl wttr.in'

# ssh agent
alias ssha='eval $(ssh-agent) && ssh-add' # good
alias startx='ssh-agent startx' # best - https://wiki.archlinux.org/title/SSH_keys#ssh-agent_as_a_wrapper_program

# safety nets
alias fsck='echo "Never use file system repair software such as fsck directly on an encrypted volume, or it will destroy any means to recover the key used to decrypt your files. Such tools must be used on the decrypted (opened) device instead"'

# alias open='xdg-open'   # see `~/.config/mimeapps.list` and `~/.local/bin/x-assignDefaultApp`

