
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

force_rm .profile
force_rm .bash_history
force_rm .bash_logout
force_rm .bash_profile
force_rm .bashrc
force_rm_dir .doom.d
force_rm .gitconfig
force_rm .gitignore_global
force_rm .mbsyncrc
force_rm .notmuch-config
force_rm .xinitrc
force_rm .Xmodmap
force_rm .pam_environment
force_rm .latexmkrc

force_rm_dir .config/alacritty
force_rm_dir .config/ulauncher
force_rm_dir .config/picom
force_rm_dir .config/bspwm
force_rm_dir .config/mutt
force_rm_dir .config/msmtp
force_rm_dir .config/polybar
force_rm_dir .config/sxhkd
force_rm_dir .config/checkmail
force_rm_dir .config/systemd
force_rm_dir .config/nvim
force_rm_dir .config/org-templates
force_rm_dir .config/lf

