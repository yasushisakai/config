#!/bin/bash

BASEDIR=$(dirname `realpath $0`)

echo $BASEDIR

# the clean.sh script will remove files and dirs.

symlink() {
	echo "link: $BASEDIR/$1 -> $HOME/$2"
	ln -s $BASEDIR/$1 $HOME/$2
}

symlink shell/bash_logout .bash_logout
symlink shell/bash_profile .bash_profile
symlink shell/bashrc .bashrc
symlink git/gitconfig .gitconfig
symlink git/gitignore_global .gitignore_global
symlink mail/mbsync/mbsyncrc .mbsyncrc
symlink mail/notmuch-config .notmuch-config
symlink shell/profile .profile

symlink mail/mutt .config/mutt
symlink mail/msmtp .config/msmtp
symlink mail/checkmail .config/checkmail
symlink nvim .config/nvim
symlink tmux .config/tmux
symlink doom.d .doom.d

# services
symlink systemd/user/emacs.service .config/systemd/user/emacs.service
symlink systemd/user/mbsync.service .config/systemd/user/mbsync.service
symlink systemd/user/mbsync.timer .config/systemd/user/mbsync.timer
