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
# Generate the complete list of symlink target we need
symlink_paths := $(addprefix $(HOME)/., $(symlinks))

# VPATH tells Make to search this list of folders when using the % pattern
# Documentation: https://www.gnu.org/software/make/manual/html_node/General-Search.html
VPATH = $(shell dirname $(files_to_symlink))

.PHONY: links
links: $(symlink_paths)

# Create all symlink
# Documentation: https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
$(HOME)/.%: %.symlink
	ln -s $(abspath $<) $@

# Beets config
$(HOME)/.config/beets/config.yaml:
	ln -s $(PWD)/beets/config.yaml $@

$(HOME)/.config/beets/library.db:
	ln -s $(PWD)/beets/library.db $@

# Sublime Merge config
$(HOME)/Library/Application\ Support/Sublime\ Merge/Packages/User:
	ln -s $(PWD)/sublime-merge $@

SUBLIME_TEXT := $$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

.PHONY: sublime-text-install
## Install Sublime Text config
sublime-text-install:
	@cp sublime-text/* $(SUBLIME_TEXT)/
	@echo "🎉 Sublime Text config is installed"

.PHONY: sublime-text-save
## Save Sublime Text config
sublime-text-save:
	@cp $(SUBLIME_TEXT)/*.sublime-settings sublime-text/
	@git add sublime-text/
	@git commit -m "🔧 Update Sublime Text config"
	@git push
	@echo "💾 Sublime Text config is saved"

.PHONY: youtube-dl-install
## Install youtube-dl config
youtube-dl-install:
	@cp youtube-dl/config ~/.config/youtube-dl/config
	@echo "🎉 youtube-dl config is installed"

.PHONY: youtube-dl-save
## Save youtube-dl config
youtube-dl-save:
	@cp ~/.config/youtube-dl/config youtube-dl/config
	@git add youtube-dl/
	@git commit -m "🔧 Update youtube-dl config"
	@git push
	@echo "💾 youtube-dl config is saved"

bin/pretty-make:
	@curl -Ls https://raw.githubusercontent.com/awea/pretty-make/master/scripts/install.sh | bash -s

.DEFAULT_GOAL := help
.PHONY: help
## List available commands
help: bin/pretty-make
	@bin/pretty-make Makefile
