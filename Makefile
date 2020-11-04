#@name Maylis Agniel dotfiles
#@description My local configuration for working on web stuff on a Mac.
#@color-title #40e0d0
#@color-subtitle #ff0000
#@color-link #0000ff

# Here we ensure that every command this Makefile run will run in a bash shell,
# instead of the default 'sh'. This is actually just a variable assignment.
SHELL := /usr/bin/env bash

.PHONY: setup
## Install softwares and stuff
setup:
	@brew bundle
	@open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app
	@open /Applications/CraftManager.app

.PHONY: beets-install
## Install beets config
beets-install:
	@cp beets/config.yaml ~/.config/beets/config.yaml
	@cp beets/library.db ~/.config/beets/library.db
	@echo "👍 beets config is installed"

.PHONY: beets-save
## Save beets config
beets-save:
	@cp ~/.config/beets/config.yaml beets/config.yaml
	@cp ~/.config/beets/library.db beets/library.db
	@git add beets/
	@git commit -m "🔧 Update beets config"
	@git push
	@echo "💾 beets config is saved"

.PHONY: git-install
## Install Git config
git-install:
	@cp git/gitconfig ~/.gitconfig
	@echo "👍 Git config is installed"

.PHONY: git-save
## Save Git config
git-save:
	@cp ~/.gitconfig git/gitconfig
	@git add git/
	@git commit -m "🔧 Update Git config"
	@git push
	@echo "💾 Git config is saved"

.PHONY: quodlibet-install
## Install QuodLibet config
quodlibet-install:
	@cp quodlibet/album_pattern ~/.quodlibet/album_pattern
	@cp quodlibet/config ~/.quodlibet/config
	@echo "👍 QuodLibet config is installed"

.PHONY: quodlibet-save
## Save QuodLibet config
quodlibet-save:
	@cp ~/.quodlibet/album_pattern quodlibet/album_pattern
	@cp ~/.quodlibet/config quodlibet/config
	@git add quodlibet/
	@git commit -m "🔧 Update QuodLibet config"
	@git push
	@echo "💾 QuodLibet config is saved"

SUBLIME_MERGE_CONFIG_DIR := /Users/maylisagniel/Library/Application\ Support/Sublime\ Merge/Packages/User

.PHONY: sublime-merge-install
## Install Sublime Merge config
sublime-merge-install:
	@cp sublime-merge/* $(SUBLIME_MERGE_CONFIG_DIR)/
	@echo "👍 Sublime Merge config is installed"

.PHONY: sublime-merge-save
## Save Sublime Merge config
sublime-merge-save:
	@cp $(SUBLIME_MERGE_CONFIG_DIR)/*.sublime-settings sublime-merge/
	@git add sublime-merge/
	@git commit -m "🔧 Update Sublime Merge config"
	@git push
	@echo "💾 Sublime Merge config is saved"

SUBLIME_TEXT_CONFIG_DIR := /Users/maylisagniel/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

/usr/local/bin/subl:
	@ln -s /Applications/Sublime Text.app/Contents/SharedSupport/bin/subl /usr/local/bin

.PHONY: sublime-text-install
## Install Sublime Text config
sublime-text-install: /usr/local/bin/subl
	@cp sublime-text/* $(SUBLIME_TEXT_CONFIG_DIR)/
	@echo "👍 Sublime Text config is installed"

.PHONY: sublime-text-save
## Save Sublime Text config
sublime-text-save:
	@cp $(SUBLIME_TEXT_CONFIG_DIR)/*.sublime-settings sublime-text/
	@git add sublime-text/
	@git commit -m "🔧 Update Sublime Text config"
	@git push
	@echo "💾 Sublime Text config is saved"

.PHONY: youtube-dl-install
## Install youtube-dl config
youtube-dl-install:
	@cp youtube-dl/config ~/.config/youtube-dl/config
	@echo "👍 youtube-dl config is installed"

.PHONY: youtube-dl-save
## Save youtube-dl config
youtube-dl-save:
	@cp ~/.config/youtube-dl/config youtube-dl/config
	@git add youtube-dl/
	@git commit -m "🔧 Update youtube-dl config"
	@git push
	@echo "💾 youtube-dl config is saved"

.PHONY: zsh-install
## Install Zsh config
zsh-install:
	@cp zsh/zshrc ~/.zshrc
	@echo "👍 Zsh config is installed"

.PHONY: zsh-save
## Save Zsh config
zsh-save:
	@cp ~/.zshrc zsh/zshrc
	@git add zsh/
	@git commit -m "🔧 Update Zsh config"
	@git push
	@echo "💾 Zsh config is saved"

.PHONY: all-install
## Install all config
all-install: beets-install git-install quodlibet-install sublime-merge-install sublime-text-install youtube-dl-install zsh-install

.PHONY: all-save
## Save all config
all-save: beets-save git-save quodlibet-save sublime-merge-save sublime-text-save youtube-dl-save zsh-save

bin/pretty-make:
	@curl -Ls https://raw.githubusercontent.com/awea/pretty-make/master/scripts/install.sh | bash -s

.DEFAULT_GOAL := help
.PHONY: help
## List available commands
help: bin/pretty-make
	@bin/pretty-make Makefile
