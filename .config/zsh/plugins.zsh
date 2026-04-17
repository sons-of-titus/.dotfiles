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

# Configure autosuggestions colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

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

# Custom syntax highlighting colors (set BEFORE sourcing the plugin)
# Main highlighters to enable
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# Main highlighter styles
typeset -A ZSH_HIGHLIGHT_STYLES

# Commands and keywords
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,underline'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'

# Paths
ZSH_HIGHLIGHT_STYLES[path]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=blue'

# Globbing and special characters
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow'

# Arguments and strings
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=8,italic'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=green'

# Brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold'

# Cursor highlighting
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'

# Pattern highlighting (highlight specific commands)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('sudo ' 'fg=red,bold')

source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

