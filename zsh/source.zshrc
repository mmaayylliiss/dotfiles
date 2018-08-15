source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Dev

## asdf - https://github.com/asdf-vm/asdf
. /usr/local/opt/asdf/asdf.sh

# Aliases

## Git WebUI - https://github.com/alberthier/git-webui
alias gui="ASDF_PYTHON_VERSION=2.7.12 git webui --no-browser"

## Kill a process by its port
function killp {
  kill -9 $( lsof -i:$1 -t ) 
}
