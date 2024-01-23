function prependToPATH_fn {
    # Prepend to path without duplicating entries
    case ":$PATH:" in
        *":$1:"*) :;; # already there
        *) PATH="$1:$PATH";;
    esac
}

function appendToPATH_fn {
    # Append to path without duplicating entries
    case ":$PATH:" in
        *":$1:"*) :;; # already there
        *) PATH="$PATH:$1";;
    esac
}

function reload () {
    exec "${SHELL}" "$@"
}

function ya() {
    # yazi wrappoer for changing directory on exit
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# function br {
#     # broot wrapper for changing directory on exit, see https://github.com/Canop/broot
#     local cmd cmd_file code
#     cmd_file=$(mktemp)
#     if broot --outcmd "$cmd_file" "$@"; then
#         cmd=$(<"$cmd_file")
#         command rm -f "$cmd_file"
#         eval "$cmd"
#     else
#         code=$?
#         command rm -f "$cmd_file"
#         return "$code"
#     fi
# }

function extract () {
    # Easily extract archives
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjvf $1    ;;
        *.tar.gz)    tar xzvf $1    ;;
        *.tar.xz)    tar xvf $1    ;;
        *.bz2)       bzip2 -d $1    ;;
        *.rar)       unrar $1    ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1    ;;
        *.tgz)       tar xzf $1    ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1    ;;
        *.7z)        7z x $1    ;;
        # *.ace)       unace x $1    ;;
        *)           echo "'$1' cannot be extracted via extract()"   ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

