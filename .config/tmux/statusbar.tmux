# ========================================
# Status Bar Configuration
# ========================================
# Catppuccin Mocha inspired theme

# Status bar general settings
set -g status-position bottom
set -g status-justify left
set -g status-style 'bg=#1e1e2e,fg=#cdd6f4'

# Left side - Session info with icon
set -g status-left-length 100
set -g status-left '#[bg=#89b4fa,fg=#1e1e2e,bold] 󰣇 #S #[bg=#1e1e2e,fg=#89b4fa] '

# Right side - System info with icons
# Using plugin format strings that will be interpolated by the plugins
set -g status-right-length 250
set -g status-right '#[fg=#f38ba8]#{battery_icon} #{battery_percentage} #[fg=#cdd6f4]| #[fg=#f38ba8]CPU: #{cpu_icon} #{cpu_percentage} #[fg=#cdd6f4]| #{net_speed} #[fg=#89dceb] #[fg=#cdd6f4]%H:%M #[fg=#a6e3a1] #[fg=#cdd6f4]%d %b #[bg=#a6e3a1,fg=#1e1e2e,bold] #{user}@#H '

# Window status format
setw -g window-status-format '#[fg=#6c7086] #I:#W#F '
setw -g window-status-current-format '#[bg=#89b4fa,fg=#1e1e2e,bold] #I:#W#F #[bg=#1e1e2e,fg=#89b4fa]'

# Window status activity
setw -g window-status-activity-style 'fg=#f38ba8,bg=#1e1e2e'
setw -g window-status-bell-style 'fg=#f9e2af,bg=#1e1e2e'

# Window status separator
setw -g window-status-separator ''

# ========================================
# Alternative Themes (uncomment to use)
# ========================================

# Minimal Powerline Style
# set -g status-style 'bg=#2e3440,fg=#d8dee9'
# set -g status-left '#[bg=#88c0d0,fg=#2e3440,bold] ❐ #S #[bg=#2e3440,fg=#88c0d0]'
# set -g status-right '#[fg=#88c0d0]#[bg=#88c0d0,fg=#2e3440] %H:%M #[bg=#88c0d0,fg=#5e81ac]#[bg=#5e81ac,fg=#eceff4,bold] %d-%b-%y '
# setw -g window-status-format '#[fg=#81a1c1] #I #W '
# setw -g window-status-current-format '#[bg=#5e81ac,fg=#eceff4,bold] #I #W #[bg=#2e3440,fg=#5e81ac]'

# Dracula Theme
# set -g status-style 'bg=#282a36,fg=#f8f8f2'
# set -g status-left '#[bg=#bd93f9,fg=#282a36,bold]  #S #[bg=#282a36,fg=#bd93f9]'
# set -g status-right '#[fg=#ff79c6] CPU: #{cpu_percentage} #[fg=#8be9fd] %H:%M #[fg=#50fa7b] %d %b #[bg=#50fa7b,fg=#282a36,bold] #(whoami) '
# setw -g window-status-format '#[fg=#6272a4] #I:#W '
# setw -g window-status-current-format '#[bg=#ff79c6,fg=#282a36,bold] #I:#W #[bg=#282a36,fg=#ff79c6]'
# set -g pane-active-border-style 'fg=#bd93f9'
