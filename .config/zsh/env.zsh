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
export PAGER="less"

# Local binaries
export PATH="$HOME/.local/bin:$PATH"

# Emacs path
export PATH="$HOME/.config/emacs/bin:$PATH"

# NVM (Lazy Load)
export NVM_DIR="$HOME/.nvm"
lazy_load_nvm() {
  # Unset placeholder functions
  unset -f nvm node npm pnpm yarn bun
  
  # Load NVM
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  
  # Execute the requested command
  if [ -n "$1" ]; then
    "$@"
  fi
}

for cmd in nvm node npm pnpm yarn bun; do
  eval "$cmd() { lazy_load_nvm \"\$0\" \"\$@\" ; }"
done

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Coursier
export PATH="$PATH:/home/mourad/.local/share/coursier/bin"

# Opam configuration
# To update the current shell environment, run: eval $(opam env)
if command -v opam &> /dev/null; then
  eval $(opam env)
fi

# SDKMAN (Lazy Load)
export SDKMAN_DIR="$HOME/.sdkman"
lazy_load_sdkman() {
  # Unset placeholder functions
  unset -f sdk java javac gradle mvn ad ant
  
  # Load SDKMAN
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  
  # Execute the requested command
  if [ -n "$1" ]; then
    "$@"
  fi
}

for cmd in sdk java javac gradle mvn ad ant; do
  eval "$cmd() { lazy_load_sdkman \"\$0\" \"\$@\" ; }"
done


export PATH="/Users/mohamedabdellahi/.antigravity/antigravity/bin:$PATH"
