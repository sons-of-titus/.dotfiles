# Environment Variables

# Qt scaling
export QT_SCALE_FACTOR=0.8

# Go configuration
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Locale
export LC_ALL=en_US.UTF-8

# Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Emacs path
export PATH="$HOME/.config/emacs/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# SDKMAN (must be at the end)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
