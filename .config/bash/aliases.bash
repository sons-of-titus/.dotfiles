# Aliases Configuration

# Basic aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Kitty icat
if command -v kitten &> /dev/null; then
    alias icat="kitten icat"
fi

# Emacs aliases
alias e='emacs -nw'
alias ec='emacsclient -nw'
alias ecg='emacsclient -c'  # GUI emacs
alias ek='emacsclient -e "(kill-emacs)"'  # Kill emacs daemon

# Neovim aliases
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias nv='nvim'
alias nvim-clean='nvim --clean'
alias nvim-config='nvim ~/.config/nvim/init.lua'

# Quick edit common config files
alias vbash='nvim ~/.config/bash/.bashrc'
alias vbe='nvim ~/.config/bash/env.bash'
alias vzsh='nvim ~/.config/zsh/.zshrc'
alias vze='nvim ~/.config/zsh/env.zsh'
alias vzp='nvim ~/.zprofile'
alias vtmux='nvim ~/.tmux.conf'
alias vgit='nvim ~/.gitconfig'

# Tmux aliases
alias t='tmux'
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'
alias tka='tmux kill-session -a'  # Kill all but current

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias gst='git status'
alias gb='git branch'
alias gba='git branch -a'

# System aliases
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias c='clear'

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'