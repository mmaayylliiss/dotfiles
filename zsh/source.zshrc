source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Dev

## asdf - https://github.com/asdf-vm/asdf
. /usr/local/opt/asdf/asdf.sh

# Aliases
## youtube-dl - https://github.com/ytdl-org/youtube-dl
alias yt="youtube-dl"

## Kill a process by its port
function killp {
  kill -9 $( lsof -i:$1 -t )
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/maylisagniel/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/maylisagniel/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/maylisagniel/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/maylisagniel/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

