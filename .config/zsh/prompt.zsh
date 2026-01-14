# Prompt Configuration

# Enable colors
autoload -U colors && colors

# Prompt customization with git branch
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PS1='%F{blue}%~%f%F{magenta}${vcs_info_msg_0_}%f %(?.%F{green}.%F{red})%#%f '
