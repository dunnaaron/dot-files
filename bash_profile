parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\e[0;32m\]\u@\h \[\e[0;34m\]\W\[\e[33m\]\$(parse_git_branch) \@\$ \[\e[00m\]"

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
