DOTFILES := $(shell pwd)

all: help
help:
	@echo "Try not. Do. Or do not. There is no try."
install: bash git vim
	@echo " * All done."
uninstall: unbash ungit unvim
	@echo " * All done."

# Bash
bash:
	ln -sf ${DOTFILES}/.bashrc ~
	@echo " * Bash dotfiles symlinked"
unbash:
	if [ -f ~/.bashrc ]; then rm ~/.bashrc; fi
	@echo " * Bash dotfiles removed"

# Git
git:
	ln -sf ${DOTFILES}/.gitconfig ~
	ln -sf ${DOTFILES}/.gitignore_global ~
	@echo " * Git dotfiles symlinked"
ungit:
	if [ -f ~/.gitconfig ]; then rm ~/.gitconfig; fi
	if [ -f ~/.gitignore_global ]; then rm ~/.gitignore_global; fi
	@echo " * Git dotfiles removed"

# Vim
vim:
	ln -sf ${DOTFILES}/.vim ~
	ln -sf ${DOTFILES}/.vimrc ~
	@echo " * Vim dotfiles symlinked"
unvim:
	if [ -d ~/.vim ]; then rm ~/.vim; fi
	if [ -f ~/.vimrc ]; then rm ~/.vimrc; fi
	@echo " * Vim dotfiles removed"

