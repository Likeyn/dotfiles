#!/usr/bin/env sh
# Setup my preciousss dotfiles

DIR="dotfiles"
URL="https://github.com/Likeyn/dotfiles.git"

# Tests if a given command exists
exists () { command -v $1 &> /dev/null; }

if [ -d $DIR ]; then
	echo " * Folder $DIR already exists; aborting"
	exit 1
elif ! exists git; then
  echo " * Cannot find `git`; aborting"
	exit 2
elif ! exists make; then
	echo " * Cannot find `make`; aborting"
	exit 2
fi

# All good, launching setup
git clone $URL
cd $DIR
git submodule update --init
make install
