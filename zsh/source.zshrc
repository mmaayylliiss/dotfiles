source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

## asdf https://github.com/asdf-vm/asdf
. /usr/local/opt/asdf/asdf.sh

## beets http://beets.io
alias beetalbum="beet import ~/Desktop/music-wip"
alias beetsingleton="beet import -s ~/Desktop/music-wip"

## macOS
alias showhiddenfiles="defaults write com.apple.finder AppleShowAllFiles YES"
alias hidehiddenfiles="defaults write com.apple.finder AppleShowAllFiles NO"

## youtube-dl https://youtube-dl.org
alias yt="youtube-dl"

## Kill a process by its port
function killp {
  kill -9 $( lsof -i:$1 -t )
}
