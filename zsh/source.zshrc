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

## SteerFox
SF_CORE_FOLDER=/Users/maylisagniel/Desktop/repositories/smb-core
GIT_OAUTH_TOKEN=0242e0a9eda77617a988b39da4deb834fd759e1c
# DEV_UID=1000
# DEV_GID=1000
