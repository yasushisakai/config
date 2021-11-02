#!/bin/bash

BASEDIR=$(dirname `realpath $0`)

echo $BASEDIR

# the clean.sh script will remove files and dirs.

symlink() {
	echo "link: $BASEDIR/$1 -> $HOME/$2"
	ln -s $BASEDIR/$1 $HOME/$2
}

symlink shell/bash_history .bash_history
symlink shell/bash_logout .bash_logout
symlink shell/bash_profile .bash_profile
symlink shell/bashrc .bashrc
symlink doom.d .doom.d
symlink git/gitconfig .gitconfig
symlink git/gitignore_global .gitignore_global
symlink mail/mbsync/mbsyncrc .mbsyncrc
symlink mail/notmuch-config .notmuch-config
symlink shell/profile .profile
symlink xinitrc .xinitrc
symlink Xmodmap .Xmodmap

symlink alacritty .config/alacritty
symlink ulauncher .config/ulauncher
symlink picom .config/picom
symlink bspwm .config/bspwm
symlink mail/mutt .config/mutt
symlink mail/msmtp .config/msmtp
symlink polybar .config/polybar
symlink sxhkd .config/sxhkd
symlink mail/checkmail .config/checkmail
symlink systemd .config/systemd 
symlink nvim .config/nvim
symlink org-templates .config/org-templates
symlink lf .config/lf
