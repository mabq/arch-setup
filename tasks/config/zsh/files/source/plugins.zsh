# Basic auto/tab complete ---
#   (not actually a plugin but act as one)
autoload -Uz compinit
zstyle ":completion:*" menu select
# zmodload zsh/complist
compinit
_comp_options+=(globdots)   # include hidden files

# Load external plugins ---
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

