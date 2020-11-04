.PHONY: setup git_install git_save quodlibet_install quodlibet_save smerge_install smerge_save subl_install subl_save youtube_dl_install youtube_dl_save zsh_install zsh_save all_install all_save help
.DEFAULT_GOAL := help

setup: ## Install softwares and stuff
	@brew bundle
	@open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app
	@open /Applications/CraftManager.app

git_install: ## Install Git config
	@cp git/config ~/.gitconfig
	@echo "👍 Git config is installed"

git_save: ## Save Git config
	@cp ~/.gitconfig git/config
	@git add git/
	@git commit -m "🔧 Update Git config"
	@git push
	@echo "💾 Git config is saved"

quodlibet_install: ## Install QuodLibet config
	@cp quodlibet/album_pattern ~/.quodlibet/album_pattern
	@cp quodlibet/config ~/.quodlibet/config
	@echo "👍 QuodLibet config is installed"

quodlibet_save: ## Save QuodLibet config
	@cp ~/.quodlibet/album_pattern quodlibet/album_pattern
	@cp ~/.quodlibet/config quodlibet/config
	@git add quodlibet/
	@git commit -m "🔧 Update QuodLibet config"
	@git push
	@echo "💾 QuodLibet config is saved"

SMERGE_CONFIG_DIR := /Users/maylisagniel/Library/Application\ Support/Sublime\ Merge/Packages/User

smerge_install: ## Install Sublime Merge config
	@cp sublime-merge/* $(SMERGE_CONFIG_DIR)/
	@echo "👍 Sublime Merge config is installed"

smerge_save: ## Save Sublime Merge config
	@cp $(SMERGE_CONFIG_DIR)/*.sublime-settings sublime-merge/
	@git add sublime-merge/
	@git commit -m "🔧 Update Sublime Merge config"
	@git push
	@echo "💾 Sublime Merge config is saved"

SUBL_CONFIG_DIR := /Users/maylisagniel/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

/usr/local/bin/subl:
	@ln -s /Applications/Sublime Text.app/Contents/SharedSupport/bin/subl /usr/local/bin

subl_install: /usr/local/bin/subl ## Install Sublime Text config
	@cp sublime-text/* $(SUBL_CONFIG_DIR)/
	@echo "👍 Sublime Text config is installed"

subl_save: ## Save Sublime Text config
	@cp $(SUBL_CONFIG_DIR)/*.sublime-settings sublime-text/
	@git add sublime-text/
	@git commit -m "🔧 Update Sublime Text config"
	@git push
	@echo "💾 Sublime Text config is saved"

youtube_dl_install: ## Install youtube-dl config
	@cp youtube-dl/config ~/.config/youtube-dl/config
	@echo "👍 youtube-dl config is installed"

youtube_dl_save: ## Save youtube-dl config
	@cp ~/.config/youtube-dl/config youtube-dl/config
	@git add youtube-dl/
	@git commit -m "🔧 Update youtube-dl config"
	@git push
	@echo "💾 youtube-dl config is saved"

zsh_install: ## Install Zsh config
	@cp zsh/zshrc ~/.zshrc
	@echo "👍 Zsh config is installed"

zsh_save: ## Save Zsh config
	@cp ~/.zshrc zsh/zshrc
	@git add zsh/
	@git commit -m "🔧 Update Zsh config"
	@git push
	@echo "💾 Zsh config is saved"

all_install: git_install quodlibet_install smerge_install subl_install youtube_dl_install zsh_install ## Install all config

all_save: git_save quodlibet_save smerge_save subl_save youtube_dl_save zsh_save ## Save all config

help: ## List available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
