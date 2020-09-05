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
