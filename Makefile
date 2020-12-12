#@name Maylis Agniel dotfiles
#@description 🖥 My local configuration (macOS)
#@color-title #4fb5f7
#@color-subtitle #ff5d4e
#@color-link #0000ff

# Here we ensure that every command this Makefile run will run in a bash shell
# instead of the default sh
SHELL := /usr/bin/env bash

# VPATH tells Make to search this list of folders when using the % pattern
# Documentation: https://www.gnu.org/software/make/manual/html_node/General-Search.html
VPATH = $(shell find . -type d -not -path "*/\.*")

.PHONY: brew
## Install tools and software with Homebrew
brew:
	@brew bundle

.PHONY: scripts
## Run various setup scripts
scripts:
	@for f in scripts/*; do ./$f; done

.PHONY: installers
## Open installers/managers
installers:
	@open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app
	@open /Applications/CraftManager.app
	@open /usr/local/Caskroom/little-snitch4/4.6/LittleSnitch-4.6.dmg

# Create symbolic links for .symlink files/folders
# Documentation: https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
$(HOME)/.%: %.symlink
	ln -fs $(abspath $<) $@

# Find all the files/folders ending with .symlink
files-to-symlink := $(shell find . -name "*.symlink")
# Extract just the name.symlink from the previous list
symlinks := $(patsubst %.symlink, %, $(shell basename -a $(files-to-symlink)))
# Generate the complete list of symlink targets we need
symlink-paths := $(addprefix $(HOME)/., $(symlinks))

include symlink-custom-paths.Makefile

## Create symbolic links
.PHONY: symlinks
symlinks: $(symlink-paths) symlink-custom-paths
	@echo "🔗 Symbolic links are created"

## Run a complete setup
.PHONY: setup
setup: brew scripts installers symlinks
	@echo "🏁 You are all set"

bin/pretty-make:
	@curl -Ls https://raw.githubusercontent.com/awea/pretty-make/master/scripts/install.sh | bash -s

.DEFAULT_GOAL := help
.PHONY: help
## List available commands
help: bin/pretty-make
	@bin/pretty-make Makefile
