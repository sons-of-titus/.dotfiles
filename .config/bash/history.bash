# History Configuration

HISTSIZE=10000
HISTFILESIZE=20000
HISTFILE=~/.bash_history

# Append to history file, don't overwrite
shopt -s histappend

# Don't put duplicate lines or lines starting with space in history
HISTCONTROL=ignoreboth

# Ignore common commands
HISTIGNORE='ls:bg:fg:history'

# Save multi-line commands as single line
shopt -s cmdhist

# Save and reload history after each command
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
