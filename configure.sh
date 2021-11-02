#!/bin/bash

BASEDIR=$(dirname `realpath $0`)

echo $BASEDIR

# the clean.sh script will remove files and dirs.

symlink() {
	echo "link: $BASEDIR/$1 -> $HOME/$2"
	ln -s $BASEDIR/$1 $HOME/$2
}

symlink git/gitconfig .gitconfig
symlink git/gitignore_global .gitignore_global
symlink mail/mbsync/mbsyncrc .mbsyncrc
symlink mail/mbsync/mbsync.plist Library/LaunchAgents/mbsync.plist
symlink mail/notmuch-config .notmuch-config
symlink shell/profile .profile
symlink shell/zshrc .zshrc
symlink shell/zshenv .zshenv

symlink mail/mutt .config/mutt
symlink mail/msmtp .config/msmtp
symlink nvim .config/nvim
symlink doom.d .doom.d
symlink lf .config/lf
