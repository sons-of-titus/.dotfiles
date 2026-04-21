# Prompt Configuration

# Enable colors
autoload -U colors && colors

# Source dynamic colors
if [[ -f "$HOME/.config/zsh/colors.zsh" ]]; then
  source "$HOME/.config/zsh/colors.zsh"
fi

# Define dynamic colors using wallpaper colors
if [[ -n "$ZSH_COLOR_PRIMARY" ]]; then
  ZSH_COLOR_BLUE="%F{#$ZSH_COLOR_PRIMARY}"
  ZSH_COLOR_YELLOW="%F{#$ZSH_COLOR_TERM3}"
  ZSH_COLOR_GREEN="%F{#$ZSH_COLOR_TERM2}"
  ZSH_COLOR_RED="%F{#$ZSH_COLOR_TERM1}"
  ZSH_COLOR_CYAN="%F{#$ZSH_COLOR_TERM2}"
else
  ZSH_COLOR_BLUE="%F{blue}"
  ZSH_COLOR_YELLOW="%F{yellow}"
  ZSH_COLOR_GREEN="%F{green}"
  ZSH_COLOR_RED="%F{red}"
  ZSH_COLOR_CYAN="%F{cyan}"
fi

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
PS1="${ZSH_COLOR_BLUE}%~%f${ZSH_COLOR_YELLOW}${vcs_info_msg_0_}%f %(?.%F{green}.%F{red})>%f "
