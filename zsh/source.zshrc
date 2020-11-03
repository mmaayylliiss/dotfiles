source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

## asdf https://github.com/asdf-vm/asdf
. /usr/local/opt/asdf/asdf.sh

## beets https://beets.readthedocs.io

# Run beets in album mode (default)
alias beetalbum="beet import /Volumes/Storage/Dropbox/music-wip"

# Run beets in singleton mode, tagging individual tracks
# instead of whole albums at a time
alias beetsingleton="beet import -s /Volumes/Storage/Dropbox/music-wip"

## macOS
alias showhiddenfiles="defaults write com.apple.finder AppleShowAllFiles YES"
alias hidehiddenfiles="defaults write com.apple.finder AppleShowAllFiles NO"

## youtube-dl https://youtube-dl.org
alias yt="youtube-dl"

## Kill a process by its port
function killp {
  kill -9 $( lsof -i:$1 -t )
}
