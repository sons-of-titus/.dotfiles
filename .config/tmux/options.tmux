# ========================================
# General Options
# ========================================

# Set prefix to Ctrl+a (change to C-Space if preferred)
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# Enable mouse support
set -g mouse on

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

# Renumber windows sequentially after closing any of them
set -g renumber-windows on

# Increase history limit
set -g history-limit 10000

# No delay for escape key (better for vim)
set -sg escape-time 0

# Focus events enabled for terminals that support them
set -g focus-events on

# Allow passthrough for terminal features
set -g allow-passthrough on

# Aggressive resize - resize windows to the size of the smallest client
setw -g aggressive-resize on

# Activity monitoring
setw -g monitor-activity on
set -g visual-activity off

# Window title
set -g set-titles on
set -g set-titles-string '#{session_name} - #{window_name}'

# Terminal colors
set -g default-terminal "screen-256color"
set -ga terminal-overrides ",*256col*:Tc"
set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'

# Pane border colors
set -g pane-border-style 'fg=#45475a'
set -g pane-active-border-style 'fg=#89b4fa'

# Pane number display
set -g display-panes-active-colour '#89b4fa'
set -g display-panes-colour '#45475a'

# Message styling
set -g message-style 'bg=#89b4fa,fg=#1e1e2e,bold'
set -g message-command-style 'bg=#f38ba8,fg=#1e1e2e,bold'

# Clock mode
setw -g clock-mode-colour '#89b4fa'
setw -g clock-mode-style 24

# Window style
setw -g window-status-separator ''

# Better command prompt
set -g status-interval 1

# Automatically rename windows
setw -g automatic-rename on
set -g renumber-windows on

# Lock command
set -g lock-command vlock

# Lock after inactivity (optional - uncomment if desired)
# set -g lock-after-time 0
