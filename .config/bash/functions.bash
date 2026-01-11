# Custom Functions

# Dotfiles management
config() {
    git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" "$@"
}

# Emacs daemon management
emacs-daemon() {
  if ! pgrep -f "emacs --daemon" > /dev/null; then
    emacs --daemon
    echo "Emacs daemon started"
  else
    echo "Emacs daemon already running"
  fi
}

# Quick edit functions with emacs
ef() {
  if command -v fzf &> /dev/null; then
    emacs -nw $(find . -type f | grep -v ".git" | head -100 | fzf-tmux -d 15)
  else
    emacs -nw $(find . -type f | grep -v ".git" | head -100)
  fi
}

# Open file at specific line (useful for compiler errors)
# Usage: el filename:linenumber
el() {
  local file_line="$1"
  local file="${file_line%%:*}"
  local line="${file_line##*:}"
  if [[ "$line" =~ ^[0-9]+$ ]]; then
    emacs -nw "+$line" "$file"
  else
    emacs -nw "$file"
  fi
}

# Open magit in current directory
magit() {
  emacsclient -nw -e "(magit-status)"
}

# Quick edit with nvim
vf() {
  nvim $(find . -type f | grep -v ".git" | head -100)
}

# Open file at specific line
vl() {
  local file_line="$1"
  local file="${file_line%%:*}"
  local line="${file_line##*:}"
  if [[ "$line" =~ ^[0-9]+$ ]]; then
    nvim "+$line" "$file"
  else
    nvim "$file"
  fi
}

# Open nvim with git modified files
vgm() {
  nvim $(git status --short | awk '{print $2}')
}

# Open nvim with git conflict files
vgc() {
  nvim $(git diff --name-only --diff-filter=U)
}

# Diff two files in nvim
vdiff() {
  nvim -d "$1" "$2"
}

# Smart tmux session management
tn() {
  if [ -n "$1" ]; then
    tmux new-session -s "$1"
  else
    tmux new-session -s "$(basename $(pwd))"
  fi
}

# Attach or create session
tac() {
  local session="$1"
  if [ -z "$session" ]; then
    session="$(basename $(pwd))"
  fi
  
  if tmux has-session -t "$session" 2>/dev/null; then
    tmux attach -t "$session"
  else
    tmux new-session -s "$session"
  fi
}

# Kill all detached sessions
tkd() {
  tmux list-sessions | grep -v attached | cut -d: -f1 | xargs -t -n1 tmux kill-session -t
}

# Create and cd into directory
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find file by name
ff() {
  find . -type f -iname "*$1*"
}

# Find directory by name
fd() {
  find . -type d -iname "*$1*"
}

# Quick backup of a file
backup() {
  cp "$1" "${1}.backup-$(date +%Y%m%d-%H%M%S)"
}

# Show PATH in readable format
path() {
  echo $PATH | tr ':' '\n'
}

# Quick project navigation
p() {
  local project_dir="${HOME}/Projects"
  if [ -d "$project_dir/$1" ]; then
    cd "$project_dir/$1"
  else
    echo "Project not found: $1"
    echo "Available projects:"
    ls -1 "$project_dir"
  fi
}

# Create a directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Search in history
h() {
  if [ -z "$1" ]; then
    history
  else
    history | grep "$1"
  fi
}

# Quick directory navigation
..() { cd ..; }
...() { cd ../..; }
....() { cd ../../..; }

# Show disk usage of current directory
duh() {
  du -h --max-depth=1 "$@" | sort -h
}

# Create a new file and open it in nvim
nv() {
  nvim "$1"
}

# Quick grep with color
gr() {
  grep -rn --color=always "$1" .
}
