# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

if [ ! "$TMUX" ]; then
	echo
	fortune
	echo
	read -r -p "You are not currently in a tmux session. Like to start one now? [Y/n]" preference

	case "$preference" in  
		[nN][oO]|[nN]) # I don't know what these[] are doing, gotta check!
			;;
		*)
			tmux
			;;
	esac
fi
