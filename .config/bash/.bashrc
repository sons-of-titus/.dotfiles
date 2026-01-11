# Main Bash Configuration
# This file sources all configuration modules from .config/bash/

# Source all configuration files
if [ -d "$HOME/.config/bash" ]; then
  # Source in order
  for config_file in \
    options.bash \
    history.bash \
    completion.bash \
    prompt.bash \
    env.bash \
    aliases.bash \
    functions.bash
  do
    [ -f "$HOME/.config/bash/$config_file" ] && source "$HOME/.config/bash/$config_file"
  done
fi
