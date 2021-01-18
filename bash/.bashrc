# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

stty -ixon
export EDITOR=vim
export LANG=en_US.utf8
alias emerge="doas emerge -av" #obviously, gentoo-specific

if [ ! "$TMUX" ]; then
	echo
	fortune -ac
	echo
	read -r -p "You are not currently in a tmux session. Like to start one now? [Y/n]" preference

	case "$preference" in  
		[nN][oO]|[nN]) # regex gang
			;;
		*)
			tmux
			;;
	esac
fi

# Keep this line at the bottom of the bashrc


# Commenting out the fish line due to causing some compatibility issues
#[ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish

