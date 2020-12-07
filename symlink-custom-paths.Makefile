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
# 20201206
# Sublime Text config is a bit tricky for some reasons:
# - Package Control MUST be installed manually through Sublime Text
# - Sublime Text operates some changes on `Preferences.sublime-settings`
# when installing packages
# - Sublime Text is not designed to import config files properly,
# so it will display a few errors in the process, just close them
#
# To handle this, we created a dedicated `sublime-text-config` bash script
# which runs only when Package Control is not installed yet
# —Maylis

.PHONY: sublime-text
sublime-text:
	@bin/sublime-text-config

# youtube-dl config
youtube-dl := $(HOME)/.config/youtube-dl

$(youtube-dl):
	ln -fs $(PWD)/youtube-dl $@

.PHONY: symlink-custom-paths
symlink-custom-paths: $(beets) sublime-merge sublime-text $(youtube-dl)
