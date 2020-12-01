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
files_to_symlink := $(shell find . -name '*.symlink')
# Extract just the name.symlink from the previous list
symlinks := $(patsubst %.symlink, %, $(shell basename -a $(files_to_symlink)))
# Generate the complete list of symlink targets we need
symlink_paths := $(addprefix $(HOME)/., $(symlinks))

# VPATH tells Make to search this list of folders when using the % pattern
# Documentation: https://www.gnu.org/software/make/manual/html_node/General-Search.html
VPATH = $(shell dirname $(files_to_symlink))

## Create symbolic links for files/folders with a .symlink suffix
.PHONY: links
links: $(symlink_paths) .configs

# Create all symlinks
# Documentation: https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
$(HOME)/.%: %.symlink
	ln -s $(abspath $<) $@

.PHONY: .configs
.configs: $(beets_config) $(beets_library) $(sublime_merge_user) $(sublime_text_user) $(youtube-dl_config)

# beets config
beets_config := $(HOME)/.config/beets/config.yaml
beets_library := $(HOME)/.config/beets/library.db

$(beets_config):
	ln -s $(PWD)/beets/config.yaml $@

$(beets_library):
	ln -s $(PWD)/beets/library.db $@

# Sublime Merge config
sublime_merge_user := $(HOME)/Library/Application\ Support/Sublime\ Merge/Packages/User

$(sublime_merge_user):
	ln -s $(PWD)/sublime-merge $@

# Sublime Text config
sublime_text_user := $(HOME)/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

$(sublime_text_user):
	ln -s $(PWD)/sublime-text $@

# youtube-dl config
youtube-dl_config := $(HOME)/.config/youtube-dl/config

$(youtube-dl_config):
	ln -s $(PWD)/youtube-dl/config $@

bin/pretty-make:
	@curl -Ls https://raw.githubusercontent.com/awea/pretty-make/master/scripts/install.sh | bash -s

.DEFAULT_GOAL := help
.PHONY: help
## List available commands
help: bin/pretty-make
	@bin/pretty-make Makefile
