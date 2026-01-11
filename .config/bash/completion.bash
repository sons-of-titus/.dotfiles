# Completion Configuration

# Enable programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Case-insensitive completion
if [[ $BASH_VERSION > 4 ]]; then
  bind "set completion-ignore-case on"
fi

# Show all completions immediately
bind "set show-all-if-ambiguous on"

# Menu completion
bind "set menu-complete-display-prefix on"
