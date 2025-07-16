# Enable color for ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliases
alias ll="ls -alGF"

# Git Aliases
alias gs="git status"
alias gc="git commit -m"
alias bcopy="git branch | grep '^\*' | cut -d' ' -f2 | tr -d '\n' | pbcopy"

# ---- Terminal Configs ----
# Prompt Styling
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info

precmd() {
  vcs_info
  if [[ -n "$vcs_info_msg_0_" ]]; then
    GIT_PROMPT="%F{green}(${vcs_info_msg_0_})%f "
  else
    GIT_PROMPT=""
  fi
}

# Set prompt
PROMPT='%F{cyan}%n@%m%f %F{blue}%B%1~%b%f ${GIT_PROMPT}%F{214}❯%f '

# Format teh vcs_info_msg_0_ var
zstyle ':vcs_info:git:*' formats '%b'
