# Plugin Configuration

# Direnv
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
