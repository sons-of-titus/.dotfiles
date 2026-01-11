# Prompt Configuration

# Colors
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[1;33m\]'
BLUE='\[\033[0;34m\]'
MAGENTA='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[1;37m\]'
RESET='\[\033[0m\]'

# Git branch function
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Git status function (shows if there are uncommitted changes)
parse_git_status() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if ! git diff-index --quiet HEAD -- 2>/dev/null; then
            echo "*"
        fi
    fi
}

# Enhanced prompt with git branch
PS1="${BLUE}\w ${GREEN}\$(parse_git_branch)${RED}\$(parse_git_status)${RESET} \$ "

# Alternative simpler prompt (uncomment to use)
# PS1='[\u@\h \W]\$ '
