.PHONY: setup beets-install beets-save git-install git-save quodlibet-install quodlibet-save sublime-merge-install sublime-merge-save sublime-text-install sublime-text-save youtube-dl-install youtube-dl-save zsh-install zsh-save all-install all-save help
.DEFAULT_GOAL := help

setup: ## Install softwares and stuff
	@brew bundle
	@open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app
	@open /Applications/CraftManager.app

beets-install: ## Install beets config
	@cp beets/config.yaml ~/.config/beets/config.yaml
	@cp beets/library.db ~/.config/beets/library.db
	@echo "👍 beets config is installed"

beets-save: ## Save beets config
	@cp ~/.config/beets/config.yaml beets/config.yaml
	@cp ~/.config/beets/library.db beets/library.db
	@git add beets/
	@git commit -m "🔧 Update beets config"
	@git push
	@echo "💾 beets config is saved"

git-install: ## Install Git config
	@cp git/gitconfig ~/.gitconfig
	@echo "👍 Git config is installed"

git-save: ## Save Git config
	@cp ~/.gitconfig git/gitconfig
	@git add git/
	@git commit -m "🔧 Update Git config"
	@git push
	@echo "💾 Git config is saved"

quodlibet-install: ## Install QuodLibet config
	@cp quodlibet/album_pattern ~/.quodlibet/album_pattern
	@cp quodlibet/config ~/.quodlibet/config
	@echo "👍 QuodLibet config is installed"

quodlibet-save: ## Save QuodLibet config
	@cp ~/.quodlibet/album_pattern quodlibet/album_pattern
	@cp ~/.quodlibet/config quodlibet/config
	@git add quodlibet/
	@git commit -m "🔧 Update QuodLibet config"
	@git push
	@echo "💾 QuodLibet config is saved"

SUBLIME_MERGE_CONFIG_DIR := /Users/maylisagniel/Library/Application\ Support/Sublime\ Merge/Packages/User

sublime-merge-install: ## Install Sublime Merge config
	@cp sublime-merge/* $(SUBLIME_MERGE_CONFIG_DIR)/
	@echo "👍 Sublime Merge config is installed"

sublime-merge-save: ## Save Sublime Merge config
	@cp $(SUBLIME_MERGE_CONFIG_DIR)/*.sublime-settings sublime-merge/
	@git add sublime-merge/
	@git commit -m "🔧 Update Sublime Merge config"
	@git push
	@echo "💾 Sublime Merge config is saved"

SUBLIME_TEXT_CONFIG_DIR := /Users/maylisagniel/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

/usr/local/bin/subl:
	@ln -s /Applications/Sublime Text.app/Contents/SharedSupport/bin/subl /usr/local/bin

sublime-text-install: /usr/local/bin/subl ## Install Sublime Text config
	@cp sublime-text/* $(SUBLIME_TEXT_CONFIG_DIR)/
	@echo "👍 Sublime Text config is installed"

sublime-text-save: ## Save Sublime Text config
	@cp $(SUBLIME_TEXT_CONFIG_DIR)/*.sublime-settings sublime-text/
	@git add sublime-text/
	@git commit -m "🔧 Update Sublime Text config"
	@git push
	@echo "💾 Sublime Text config is saved"

youtube-dl-install: ## Install youtube-dl config
	@cp youtube-dl/config ~/.config/youtube-dl/config
	@echo "👍 youtube-dl config is installed"

youtube-dl-save: ## Save youtube-dl config
	@cp ~/.config/youtube-dl/config youtube-dl/config
	@git add youtube-dl/
	@git commit -m "🔧 Update youtube-dl config"
	@git push
	@echo "💾 youtube-dl config is saved"

zsh-install: ## Install Zsh config
	@cp zsh/zshrc ~/.zshrc
	@echo "👍 Zsh config is installed"

zsh-save: ## Save Zsh config
	@cp ~/.zshrc zsh/zshrc
	@git add zsh/
	@git commit -m "🔧 Update Zsh config"
	@git push
	@echo "💾 Zsh config is saved"

all-install: beets-install git-install quodlibet-install sublime-merge-install sublime-text-install youtube-dl-install zsh-install ## Install all config

all-save: beets-save git-save quodlibet-save sublime-merge-save sublime-text-save youtube-dl-save zsh-save ## Save all config

help: ## List available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
