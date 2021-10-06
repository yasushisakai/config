
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

force_rm .gitconfig
force_rm .gitignore
force_rm .mbsyncrc
force_rm .profile

force_rm_dir .config/mutt
force_rm_dir .config/msmtp
force_rm_dir .config/nvim

