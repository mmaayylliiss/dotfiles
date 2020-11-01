source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

## asdf https://github.com/asdf-vm/asdf
. $HOME/.asdf/asdf.sh

## youtube-dl https://github.com/ytdl-org/youtube-dl
alias yt="youtube-dl"

## Kill a process by its port
function killp {
  kill -9 $( lsof -i:$1 -t )
}
