# Aliases Configuration

# Kitty icat
alias icat="kitten icat"

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
