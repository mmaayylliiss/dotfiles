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

.PHONY: install
## Install software
install:
	@brew bundle
	# Run all setup scripts
	@for f in scripts/*; do ./$f; done
	# Open installers/managers
	@open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app
	@open /Applications/CraftManager.app
	@open /usr/local/Caskroom/little-snitch4/4.6/LittleSnitch-4.6.dmg

# Create symbolic links for .symlink files/folders
# Documentation: https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
$(HOME)/.%: %.symlink
	ln -fs $(abspath $<) $@

# 20201203
# By default symlinks are created as dotfiles in $HOME (e.g.: $HOME/.zshrc)
# For other cases (e.g.: $HOME/.config/*) there are two approaches:
# 1. Dotfiles repository structure must match the system directory structure (messy)
# 2. Create those symlinks manually (simpler)
# We therefore chose the second option
# —Maylis
#
# beets config
beets := $(HOME)/.config/beets

$(beets):
	ln -fs $(PWD)/beets $@

# Sublime Merge and Sublime Text config
#
# 20201202
# We cannot use a recipe with spaces in its name, it just does not work
# Here is an attempt to fix that: using .PHONY target, manually removing
# `User` directory then creating symbolic link
# See https://stackoverflow.com/q/9838384
# —Maylis
sublime-merge := $(HOME)/Library/Application\ Support/Sublime\ Merge/Packages/User

.PHONY: sublime-merge
sublime-merge:
	rm -rf $(sublime-merge)
	ln -fs $(PWD)/sublime-merge $(sublime-merge)

sublime-text := $(HOME)/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

.PHONY: sublime-text
sublime-text:
	rm -rf $(sublime-text)
	ln -fs $(PWD)/sublime-text $(sublime-text)

# youtube-dl config
youtube-dl := $(HOME)/.config/youtube-dl

$(youtube-dl):
	ln -fs $(PWD)/youtube-dl $@

.PHONY: .configs
.configs: $(beets) sublime-merge sublime-text $(youtube-dl)

# Find all the files/folders ending with .symlink
files-to-symlink := $(shell find . -name "*.symlink")
# Extract just the name.symlink from the previous list
symlinks := $(patsubst %.symlink, %, $(shell basename -a $(files-to-symlink)))
# Generate the complete list of symlink targets we need
symlink-paths := $(addprefix $(HOME)/., $(symlinks))

## Create symbolic links for all dotfiles
.PHONY: links
links: $(symlink-paths) .configs

## Install software and create symbolic links
.PHONY: setup
setup: install links

bin/pretty-make:
	@curl -Ls https://raw.githubusercontent.com/awea/pretty-make/master/scripts/install.sh | bash -s

.DEFAULT_GOAL := help
.PHONY: help
## List available commands
help: bin/pretty-make
	@bin/pretty-make Makefile
