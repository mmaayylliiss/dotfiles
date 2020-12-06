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

# Sublime Merge config
.PHONY: sublime-merge-open
sublime-merge-open:
	@smerge

.PHONY: sublime-merge-open-current
sublime-merge-open-current:
	@smerge .

.PHONY: sublime-merge-quit
sublime-merge-quit:
	@pkill "sublime_merge"

# 20201202
# We cannot use a recipe with spaces in its name, it just does not work
# Here is an attempt to fix that: using .PHONY target, manually removing
# `User` directory then creating symbolic link
# (same is done for Sublime Text)
# See https://stackoverflow.com/q/9838384
# —Maylis
sublime-merge := $(HOME)/Library/Application\ Support/Sublime\ Merge/Packages/User

.PHONY: sublime-merge
sublime-merge: sublime-merge-open sublime-merge-quit
	@rm -rf $(sublime-merge)
	ln -fs $(PWD)/sublime-merge $(sublime-merge)

# Sublime Text config
#
# 20201205
# Sublime Text config is a bit tricky for some reasons:
# - Package Control MUST be installed manually through Sublime Text
# - Sublime Text operates some changes on `Preferences.sublime-settings`
# when installing packages
# - Sublime Text is not designed to import config files properly,
# so it will display a few errors in the process, just close them
#
# To handle this, the process has been split into many steps
# —Maylis
.PHONY: sublime-text-open
sublime-text-open:
	@subl

.PHONY: sublime-text-quit
sublime-text-quit:
	@pkill "Sublime Text"

sublime-text-package-control := $(HOME)/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package

$(sublime-text-package-control): sublime-text-open
	@$(shell bash -c "read -p '✋ Install Package Control in Sublime Text then hit enter'")

sublime-text-user := $(HOME)/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

.PHONY: sublime-text-symlinks
sublime-text-symlinks: $(sublime-text-package-control) sublime-text-quit
	@rm -rf $(sublime-text-user)
	ln -fs $(PWD)/sublime-text $(sublime-text-user)

.PHONY: sublime-text-open-manually
sublime-text-open-manually: sublime-text-symlinks
	@$(shell bash -c "read -p '✋ Open Sublime Text manually then hit enter'")

.PHONY: sublime-text-packages-installation
sublime-text-packages-installation: sublime-text-open-manually
	@$(shell bash -c "read -p '⏳ Sublime Text is currently completing packages installation, hit enter when it is done'")

.PHONY: sublime-text-discard-changes
sublime-text-discard-changes: sublime-text-packages-installation sublime-text-quit sublime-merge-open-current
	@$(shell bash -c "read -p '✋ Discard unwanted changes on Preferences.sublime-settings then hit enter'")

.PHONY: sublime-text
sublime-text: sublime-text-discard-changes

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

## Create symbolic links
.PHONY: symlinks
symlinks: $(symlink-paths) .configs
	@echo "🎉 Symbolic links are created"

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
