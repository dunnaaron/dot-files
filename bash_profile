# Parse and display git branch on the terminal
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Here's PS1 config docs https://ss64.com/bash/syntax-prompt.html
# Here's a helpful link for configuring color codes https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
export PS1="\[\e[0;32m\]\u@\h \[\e[0;36m\]\W\[\e[38;5;202m\]\$(parse_git_branch) \t\$ \[\e[00m\]"

# This allows access to my variables regardless of whether or not it is a login shell/interactive shell (I'm not getting the terminology right)
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Silences the zsh default shell message
export BASH_SILENCE_DEPRECATION_WARNING=1
