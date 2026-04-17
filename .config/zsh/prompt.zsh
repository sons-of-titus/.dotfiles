# Prompt Configuration

# Enable colors
autoload -U colors && colors

# Enable version control info
autoload -Uz vcs_info

# Configure vcs_info for git
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedchanges '%F{green}✓%f'
zstyle ':vcs_info:*' unstagedchanges '%F{red}✗%f'
zstyle ':vcs_info:git:*' formats ' %F{magenta}(%F{cyan}%b%f%F{magenta})%f%c%u'
zstyle ':vcs_info:git:*' actionformats ' %F{magenta}(%F{cyan}%b%f%F{magenta}|%F{red}%a%f%F{magenta})%f%c%u'

# Update vcs_info before each prompt
precmd() { 
    vcs_info 
}

# Simple, colorful single-line prompt
PS1='%F{blue}%~%f%F{yellow}${vcs_info_msg_0_}%f %(?.%F{green}.%F{red})>%f '
