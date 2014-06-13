# Dotfiles makefile

# Init
DIR := $$(pwd)
.ONESHELL:
.PHONY: all help install uninstall bash unbash git ungit vim unvim
.SILENT: all help install uninstall bash unbash git ungit vim unvim
.IGNORE: all help install uninstall bash unbash git ungit vim unvim

# Recipes
all: help
help:
	echo "Try not. Do. Or do not. There is no try."
install: bash git vim
	echo " * All done."
uninstall: unbash ungit unvim
	echo " * All done."

# Bash
bash:
	ln -sf ${DIR}/.bashrc ~
	echo " * Bash dotfiles symlinked"
unbash:
	if [ -f ~/.bashrc ]; then rm ~/.bashrc; fi
	echo " * Bash dotfiles removed"

# Git
git:
	ln -sf ${DIR}/.gitconfig ~
	ln -sf ${DIR}/.gitignore_global ~
	echo " * Git dotfiles symlinked"
ungit:
	if [ -f ~/.gitconfig ]; then rm ~/.gitconfig; fi
	if [ -f ~/.gitignore_global ]; then rm ~/.gitignore_global; fi
	echo " * Git dotfiles removed"

# Vim
vim:
	ln -sf ${DIR}/.vim ~
	ln -sf ${DIR}/.vimrc ~
	echo " * Vim dotfiles symlinked"
unvim:
	if [ -d ~/.vim ]; then rm ~/.vim; fi
	if [ -f ~/.vimrc ]; then rm ~/.vimrc; fi
	echo " * Vim dotfiles removed"

