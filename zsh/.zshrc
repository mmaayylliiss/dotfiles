## Antibody https://getantibody.github.io
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

## asdf https://asdf-vm.com
. /usr/local/opt/asdf/asdf.sh

## beets https://beets.readthedocs.io
##
## Run beets in album mode (default)
alias beetalbum="beet import /Volumes/Storage/Dropbox/music-wip"
## Run beets in singleton mode, tagging individual tracks
## instead of whole albums at a time
alias beetsingleton="beet import -s /Volumes/Storage/Dropbox/music-wip"

## Kill a process by its port
function killp {
  kill -9 $( lsof -i:$1 -t )
}

## macOS
alias showhiddenfiles="defaults write com.apple.finder AppleShowAllFiles YES"
alias hidehiddenfiles="defaults write com.apple.finder AppleShowAllFiles NO"

## System
alias ll="ls -l"

## youtube-dl https://youtube-dl.org
alias yt="youtube-dl"

## Zsh https://www.zsh.org
##
## Automatic `cd`
setopt AUTO_CD
