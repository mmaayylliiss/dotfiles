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
#
# 20201207
# The bash script only runs if there is not already a symbolic link
# for Sublime Merge config
# —Maylis
.PHONY: sublime-merge
sublime-merge:
	@bin/sublime-merge-config

# Sublime Text config
#
# 20201207
# Sublime Text config is a bit tricky for some reasons:
# - Package Control MUST be installed manually through Sublime Text
# - Sublime Text operates some changes on `Preferences.sublime-settings`
# when installing packages
# - Sublime Text is not designed to import config files properly,
# so it will display a few errors in the process, just close them
#
# To handle this, we created a dedicated `sublime-text-config` bash script
# that runs differently depending on whether Package Control
# is installed or not
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
