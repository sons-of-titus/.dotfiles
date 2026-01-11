# Completion System Configuration

autoload -Uz compinit && compinit

zstyle ':completion:*' menu select                          # Visual menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'        # Case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colored completion
zstyle ':completion:*' group-name ''                        # Group results
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
