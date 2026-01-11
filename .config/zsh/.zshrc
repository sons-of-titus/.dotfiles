# Main Zsh Configuration
# This file sources all configuration modules from .config/zsh/

# Source all configuration files
if [ -d "$HOME/.config/zsh" ]; then
  # Source in order
  for config_file in \
    options.zsh \
    history.zsh \
    completion.zsh \
    prompt.zsh \
    env.zsh \
    aliases.zsh \
    functions.zsh \
    plugins.zsh
  do
    [ -f "$HOME/.config/zsh/$config_file" ] && source "$HOME/.config/zsh/$config_file"
  done
fi
