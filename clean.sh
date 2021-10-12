
# removes directory if exists
force_rm_dir() {
	if [ -e $HOME/$1 ]
	then
		echo "removing dir: $HOME/$1"
		rm -rf $HOME/$1
	fi
}

# removes file if exists
force_rm() {
	if [ -e $HOME/$1 ]
	then
		echo "removing: $HOME/$1"
		rm $HOME/$1
	fi
}

force_rm .bash_logout
force_rm .bash_profile
force_rm .bashrc
force_rm .gitconfig
force_rm .gitignore_global
force_rm .mbsyncrc
force_rm .notmuch-config
force_rm .profile

force_rm_dir .doom.d
force_rm_dir .config/mutt
force_rm_dir .config/msmtp
force_rm_dir .config/checkmail
force_rm_dir .config/nvim
force_rm_dir .config/tmux
force_rm_dir .config/org-templates

# services
force_rm .config/systemd/user/emacs.service 
force_rm .config/systemd/user/mbsync.service 
force_rm .config/systemd/user/mbsync.timer 

