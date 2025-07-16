# Enable prompt variable expansion (such as GIT_PROMPT)
setopt PROMPT_SUBST

# Enable color for ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliases
alias ll="ls -alGF"
alias srczsh="source ~/.zshrc"
alias vim="nvim"

# Git Aliases
alias gs="git status"
alias gc="git commit -m"
alias gan="git add . -N"
alias gap="git add . -p"
alias bcopy="git branch | grep '^\*' | cut -d' ' -f2 | tr -d '\n' | pbcopy"

# ---- Terminal Configs ----
# Prompt Styling
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info

precmd() {
  vcs_info
  if [[ -n "$vcs_info_msg_0_" ]]; then
    GIT_PROMPT="%F{157}(${vcs_info_msg_0_})%f "
  else
    GIT_PROMPT=""
  fi
}

# Set prompt
PROMPT='%F{212}%n@%m%f %F{blue}%B%1~%b%f ${GIT_PROMPT}%F{214}❯%f '

# Format teh vcs_info_msg_0_ var
zstyle ':vcs_info:git:*' formats '%b'

# Source local plugins from .zsh
source ~/.zsh/zsh-autosuggestions.zsh
