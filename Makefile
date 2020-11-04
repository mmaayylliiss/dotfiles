.PHONY: setup git_install git_save quodlibet_install quodlibet_save smerge_install smerge_save subl_install subl_save zsh_install zsh_save youtube_dl_install youtube_dl_save all_install all_save help
.DEFAULT_GOAL := help

setup: ## Install softwares and stuff
	@brew bundle
	@open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app
	@open /Applications/CraftManager.app

git_install: ## Install Git configuration
	@cp git/config ~/.gitconfig
	@echo "👍 Git installed"

git_save: ## Save Git configuration
	@cp ~/.gitconfig git/config
	@git add git/
	@git commit -m "🔧 Update Git"
	@git push
	@echo "💾 Git saved"

quodlibet_install: ## Install QuodLibet configuration
	@cp quodlibet/album_pattern ~/.quodlibet/album_pattern
	@cp quodlibet/config ~/.quodlibet/config
	@echo "👍 QuodLibet installed"

quodlibet_save: ## Save QuodLibet configuration
	@cp ~/.quodlibet/album_pattern quodlibet/album_pattern
	@cp ~/.quodlibet/config quodlibet/config
	@git add quodlibet/
	@git commit -m "🔧 Update QuodLibet"
	@git push
	@echo "💾 QuodLibet saved"

SMERGE_CONFIG_DIR := /Users/maylisagniel/Library/Application\ Support/Sublime\ Merge/Packages/User

smerge_install: ## Install Sublime Merge configuration files
	@cp sublime-merge/config/* $(SMERGE_CONFIG_DIR)/
	@echo "👍 Sublime Merge installed"

smerge_save: ## Save Sublime Merge configuration files
	@cp $(SMERGE_CONFIG_DIR)/*.sublime-settings sublime-merge/config/
	@git add sublime-merge/
	@git commit -m "🔧 Update Sublime Merge"
	@git push
	@echo "💾 Sublime Merge saved"

SUBL_CONFIG_DIR := /Users/maylisagniel/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

/usr/local/bin/subl:
	@ln -s /Applications/Sublime Text.app/Contents/SharedSupport/bin/subl /usr/local/bin

subl_install: /usr/local/bin/subl ## Install Sublime Text configuration files
	@cp sublime-text/config/* $(SUBL_CONFIG_DIR)/
	@echo "👍 Sublime Text installed"

subl_save: ## Save Sublime Text configuration files
	@cp $(SUBL_CONFIG_DIR)/*.sublime-settings sublime-text/config/
	@git add sublime-text/
	@git commit -m "🔧 Update Sublime Text"
	@git push
	@echo "💾 Sublime Text saved"

zsh_install: ## Install Zsh configuration files
	@cp zsh/source.zshrc ~/.zshrc
	@echo "👍 Zsh installed"

zsh_save: ## Save Zsh configuration files
	@cp ~/.zshrc zsh/source.zshrc
	@git add zsh/
	@git commit -m "🔧 Update Zsh"
	@git push
	@echo "💾 Zsh saved"

youtube_dl_install: ## Install youtube-dl configuration
	@cp youtube-dl/config ~/.config/youtube-dl/config
	@echo "👍 youtube-dl installed"

youtube_dl_save: ## Save youtube-dl configuration
	@cp ~/.config/youtube-dl/config youtube-dl/config
	@git add youtube-dl/
	@git commit -m "🔧 Update youtube-dl"
	@git push
	@echo "💾 youtube-dl saved"

all_install: git_install quodlibet_install smerge_install subl_install zsh_install youtube_dl_install ## Install all configuration files

all_save: git_save quodlibet_save smerge_save subl_save zsh_save youtube_dl_save ## Save all configuration files

help: ## List available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
