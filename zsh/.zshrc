# ---
# Antibody https://getantibody.github.io
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

# ---
# asdf https://asdf-vm.com
. /usr/local/opt/asdf/asdf.sh

# ---
# beets https://beets.readthedocs.io
#
# Run beets in album mode (default)
alias beetalbum="beet import /Volumes/Storage/Dropbox/music-wip"

# Run beets in singleton mode, tagging individual tracks
# instead of whole albums at a time
alias beetsingleton="beet import -s /Volumes/Storage/Dropbox/music-wip"

# ---
# Git
# Aliases copied from Prezto (only the ones I need),
# see: https://github.com/sorin-ionescu/prezto/blob/master/modules/git/alias.zsh#L30
#
# Git
alias g="git"

# Branch (b)
alias gb="git branch"
alias gba="git branch --all --verbose"
alias gbc="git checkout -b"

# Fetch (f)
alias gfa="git fetch --all"
alias gfc="git clone"
alias gfr="git pull --rebase"

# Push (p)
alias gp="git push"
alias gpF="git push --force"
alias gpA="git push --all && git push --tags"

# Remote (R)
alias gR="git remote"
alias gRa="git remote add"
alias gRx="git remote rm"

# Tag (t)
alias gt="git tag"

# ---
# Kill a process by its port
function killp {
  kill -9 $( lsof -i:$1 -t )
}

# ---
# macOS
alias showhiddenfiles="defaults write com.apple.finder AppleShowAllFiles YES"
alias hidehiddenfiles="defaults write com.apple.finder AppleShowAllFiles NO"

# ---
# Powerlevel10k https://github.com/romkatv/powerlevel10k
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---
# System
alias ll="ls -l"

# ---
# youtube-dl https://youtube-dl.org
alias yt="youtube-dl"

# ---
# Zsh https://www.zsh.org
#
# Automatic `cd`
setopt AUTO_CD

# Automatically add quotes to URLs
# Copied from Prezto,
# see: https://github.com/sorin-ionescu/prezto/blob/master/modules/environment/init.zsh#L12
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

# ---
# zsh-completions https://github.com/zsh-users/zsh-completions
#
# Check cache once a day
# Source: https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2308206
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
