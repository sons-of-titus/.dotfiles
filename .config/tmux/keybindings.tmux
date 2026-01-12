# ========================================
# Keybindings
# ========================================

# Reload config with prefix + r
bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

# Better split commands (| and -)
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %

# Vim-style pane navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Resize panes with H/J/K/L
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# Swap panes
bind > swap-pane -D
bind < swap-pane -U

# Break pane into window
bind b break-pane

# Join pane from window
bind j choose-window 'join-pane -h -s "%%"'

# Vim-style copy mode
setw -g mode-keys vi
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-selection-and-cancel
bind -T copy-mode-vi r send -X rectangle-toggle

# Copy to system clipboard (requires xclip or xsel on Linux)
bind -T copy-mode-vi y send -X copy-pipe-and-cancel "xclip -in -selection clipboard"
bind -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "xclip -in -selection clipboard"

# Paste from system clipboard
bind ] paste-buffer

# Quick window selection
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# Quick session switching
bind S choose-session

# New window in current path
bind c new-window -c "#{pane_current_path}"

# Kill pane
bind x kill-pane

# Kill window
bind & kill-window

# Detach client
bind d detach-client

# List keys
bind ? list-keys

# List buffers
bind b list-buffers

# Show messages (removed ~ binding due to conflicts, use: prefix + : then type 'show-messages')
# Alternative: bind it to a different key if needed
# bind m show-messages

# Enter copy mode
bind Escape copy-mode

# Clear history
bind C-l send-keys C-l \; clear-history

# Synchronize panes
bind * setw synchronize-panes

# Maximize/minimize pane
bind + resize-pane -Z
bind = resize-pane -Z

# Select last window
bind Space last-window

# Choose tree
bind t choose-tree -Zw

# Rename window
bind , command-prompt -I "#{window_name}" "rename-window '%%'"

# Rename session
bind $ command-prompt -I "#{session_name}" "rename-session '%%'"
