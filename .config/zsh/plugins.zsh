# Plugin Configuration

# Plugin directory
ZSH_PLUGINS="$HOME/.config/zsh/plugins"
mkdir -p "$ZSH_PLUGINS"

# zsh-autosuggestions
if [ ! -d "$ZSH_PLUGINS/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS/zsh-autosuggestions"
fi
source "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Direnv
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# zsh-syntax-highlighting (must be last)
if [ ! -d "$ZSH_PLUGINS/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGINS/zsh-syntax-highlighting"
fi
source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
