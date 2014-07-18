# Dotfiles makefile

# Init
DIR := $$(pwd)
EXT := .symlink
INSTALL := bash git homebin vim
UNINSTALL := $(addprefix un, ${INSTALL})
TARGETS := ${INSTALL} ${UNINSTALL}
.PHONY: all help install uninstall ${TARGETS}
.SILENT:
.ONESHELL:

# General recipes
all: help
help:
	echo "Try not. Do. Or do not. There is no try."
install: bash git vim homebin
	echo " * All done."
uninstall: unbash ungit unvim unhomebin
	echo " * All done."

# Bash
bash: _install/.bashrc
	echo " * Bash dotfiles installed"
unbash: _uninstall/.bashrc
	echo " * Bash dotfiles uninstalled"

# Git
git: _install/.gitconfig _install/.gitignore_global
	echo " * Git dotfiles installed"
ungit: _uninstall/.gitconfig _uninstall/.gitignore_global
	echo " * Git dotfiles uninstalled"

# Vim
vim: _install/.vim _install/.vimrc
	echo " * Vim dotfiles installed"
unvim: _uninstall/.vim _uninstall/.vimrc
	echo " * Vim dotfiles uninstalled"

# Home bin folder
homebin: $(foreach F, $(wildcard bin/*${EXT}), _install/$(basename $F))
	echo " * Content of the bin folder installed"
unhomebin: $(foreach F, $(wildcard bin/*${EXT}), _uninstall/$(basename $F))
	echo " * Content of the bin folder uninstalled"

# Internal install / uninstall rules
FORCE:
_install/%: FORCE
	# echo " * Symlinking $*${EXT} to ~/$*"
	ln -isT ${DIR}/$*${EXT} ~/$*
_uninstall/%: FORCE
	if [ -L ~/$* -a "$$(readlink ~/$*)" = "${DIR}/$*${EXT}" ]; then rm -r ~/$*; fi

