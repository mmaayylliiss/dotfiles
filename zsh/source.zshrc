source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Dev

## asdf - https://github.com/asdf-vm/asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

## Append XAMP/bin to $PATH
export PATH=$PATH:/Applications/XAMPP/bin/

# Aliases

## Git WebUI - https://github.com/alberthier/git-webui
alias gui="ASDF_PYTHON_VERSION=2.7.12 git webui --no-browser"

## Kill a process by its port
function killp {
  kill -9 $( lsof -i:$1 -t ) 
}
