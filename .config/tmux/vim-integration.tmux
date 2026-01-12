# ========================================
# Vim/Tmux Integration
# ========================================
# Smart pane switching with awareness of Vim splits
# Allows seamless navigation between tmux panes and vim windows

# Check if current pane is running vim
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

# Smart pane switching - pass through to vim if in vim, otherwise switch panes
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'

# Last pane
bind-key -n 'C-\' if-shell "$is_vim" 'send-keys C-\\\\'  'select-pane -l'

# For tmux copy mode
bind-key -T copy-mode-vi 'C-h' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-l' select-pane -R
bind-key -T copy-mode-vi 'C-\' select-pane -l

# Vim-style selection in copy mode
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

# Search in copy mode
bind-key -T copy-mode-vi / command-prompt -i -p "(search down)" "send -X search-forward-incremental \"%%%\""
bind-key -T copy-mode-vi ? command-prompt -i -p "(search up)" "send -X search-backward-incremental \"%%%\""

# Better scrolling in copy mode
bind-key -T copy-mode-vi j send-keys -X cursor-down
bind-key -T copy-mode-vi k send-keys -X cursor-up
