#export SHELL
export PATH=~/.local/bin:$PATH
export CC="gcc"
export LC_COLLATE="C" #ls collates dotfiles first for dired


if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell.  If this
    # is an SSH session (as in "ssh host command"), source
    # /etc/profile so we get PATH and other essential variables.
    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
    return
fi

GUIX_PROFILE="$HOME/.guix-profile"
. "$GUIX_PROFILE"/etc/profile

[ -f ~/.bashrc ] && . ~/.bashrc
