#@name Maylis Agniel dotfiles
#@description 🖥 My local configuration (macOS)
#@color-title #4fb5f7
#@color-subtitle #ff5d4e
#@color-link #0000ff

# Here we ensure that every command this Makefile run will run in a bash shell
# instead of the default sh
SHELL := /usr/bin/env bash

.PHONY: setup
## Install software
setup:
	@brew bundle
	# Run all setup scripts
	@for f in scripts/*; do ./$f; done
	# Open installers/managers
	@open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app
	@open /Applications/CraftManager.app
	@open /usr/local/Caskroom/little-snitch4/4.6/LittleSnitch-4.6.dmg

# Find all the files/folders ending with .symlink
files-to-symlink := $(shell find . -name "*.symlink")
# Extract just the name.symlink from the previous list
symlinks := $(patsubst %.symlink, %, $(shell basename -a $(files-to-symlink)))
# Generate the complete list of symlink targets we need
symlink-paths := $(addprefix $(HOME)/., $(symlinks))

# VPATH tells Make to search this list of folders when using the % pattern
# Documentation: https://www.gnu.org/software/make/manual/html_node/General-Search.html
VPATH = $(shell find . -type d -not -path "*/\.*")

## Create symbolic links for files/folders with a .symlink suffix
.PHONY: links
links: $(symlink-paths) .configs

# Create all symlinks
# Documentation: https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
$(HOME)/.%: %.symlink
	ln -fs $(abspath $<) $@

.PHONY: .configs
.configs: $(beets-config) $(beets-library) sublime-merge-user sublime-text-user $(youtube-dl-config)

# beets config
beets-config := $(HOME)/.config/beets/config.yaml
beets-library := $(HOME)/.config/beets/library.db

$(beets-config):
	ln -fs $(PWD)/beets/config.yaml $@

$(beets-library):
	ln -fs $(PWD)/beets/library.db $@

# Sublime Merge and Sublime Text config
#
# 20201202
# We cannot use a recipe with spaces in its name, it just does not work
# Here is an attempt to fix that: using .PHONY target, manually removing
# `User` directory then creating symbolic link
# See https://stackoverflow.com/q/9838384
# —Maylis
sublime-merge-user-path := $(HOME)/Library/Application\ Support/Sublime\ Merge/Packages/User

.PHONY: sublime-merge-user
sublime-merge-user:
	rm -rf $(sublime-merge-user-path)
	ln -fs $(PWD)/sublime-merge $(sublime-merge-user-path)

sublime-text-user-path := $(HOME)/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

.PHONY: sublime-text-user
sublime-text-user:
	rm -rf $(sublime-text-user-path)
	ln -fs $(PWD)/sublime-text $(sublime-text-user-path)

# youtube-dl config
youtube-dl-config := $(HOME)/.config/youtube-dl/config

$(youtube-dl-config):
	ln -fs $(PWD)/youtube-dl/config $@

bin/pretty-make:
	@curl -Ls https://raw.githubusercontent.com/awea/pretty-make/master/scripts/install.sh | bash -s

.DEFAULT_GOAL := help
.PHONY: help
## List available commands
help: bin/pretty-make
	@bin/pretty-make Makefile
