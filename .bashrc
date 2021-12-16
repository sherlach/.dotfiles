#if [[ $- != *i* ]]
#then
    # We are being invoked from a non-interactive shell.  If this
    # is an SSH session (as in "ssh host command"), source
    # /etc/profile so we get PATH and other essential variables.
#    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
#    return
#fi


# Source the system-wide file
#source /etc/bashrc

# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1='\u@\h \w [env]\$ '
else
    PS1='\u@\h \w\$ '
fi

alias ls='ls -p --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'
alias python='python3'
