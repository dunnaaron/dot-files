parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Here's PS1 config docs https://ss64.com/bash/syntax-prompt.html
export PS1="\[\e[0;32m\]\u@\h \[\e[0;36m\]\W\[\e[33m\]\$(parse_git_branch) \t\$ \[\e[00m\]"

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export BASH_SILENCE_DEPRECATION_WARNING=1


