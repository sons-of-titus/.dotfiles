# ========================================
# Plugin Manager Configuration
# ========================================
# TPM (Tmux Plugin Manager) setup

# Set TPM installation path
set-environment -g TMUX_PLUGIN_MANAGER_PATH "~/.config/tmux/plugins"

# List of plugins
# Install plugins with: prefix + I
# Update plugins with: prefix + U
# Remove plugins with: prefix + alt + u

# Essential plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Better navigation
set -g @plugin 'christoomey/vim-tmux-navigator'

# Better session management
set -g @plugin 'tmux-plugins/tmux-sessionist'

# Better yanking (copy to system clipboard)
set -g @plugin 'tmux-plugins/tmux-yank'

# Better pane management
set -g @plugin 'tmux-plugins/tmux-pain-control'
set -g @plugin 'tmux-plugins/tmux-open'

# Better window management
set -g @plugin 'tmux-plugins/tmux-logging'

# System monitoring
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-net-speed'
set -g @plugin 'tmux-plugins/tmux-online-status'

# Better copy mode
set -g @plugin 'tmux-plugins/tmux-copycat'

# Better search (requires urlview or extract_url - install with: sudo pacman -S urlview)
# Uncomment if you have urlview or extract_url installed
# set -g @plugin 'tmux-plugins/tmux-urlview'

# Better prefix highlighting
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

# Better mode indicator
set -g @plugin 'tmux-plugins/tmux-mode-indicator'

# Better sidebar
set -g @plugin 'tmux-plugins/tmux-sidebar'

# Better fzf integration
set -g @plugin 'sainnhe/tmux-fzf'

# Better theme support (commented out - conflicts with custom status bar)
# Uncomment if you want to use onedark theme instead of custom status bar
# set -g @plugin 'odedlaz/tmux-onedark-theme'

# Better notifications
set -g @plugin 'tmux-plugins/tmux-notify'

# ========================================
# Plugin Configuration
# ========================================

# Resurrect - save and restore tmux sessions
set -g @resurrect-strategy-vim 'session'
set -g @resurrect-capture-pane-contents 'on'
set -g @resurrect-save-bash-history 'on'
set -g @resurrect-save-shell-history 'on'

# Continuum - auto-restore and auto-save
set -g @continuum-restore 'on'
set -g @continuum-save-interval '15'
set -g @continuum-boot 'on'

# Yank configuration
set -g @yank_selection_mouse 'clipboard'
set -g @yank_selection 'clipboard'
set -g @yank_action 'copy-pipe-no-clear'

# Sessionist - better session management
set -g @sessionist-always-other-window 'on'
set -g @sessionist-git 'on'

# Pain Control - better pane management
set -g @pain-control-resize-step-x 10
set -g @pain-control-resize-step-y 5

# Logging
set -g @logging-path '$HOME/.config/tmux/logs'

# Copycat - better copy mode
set -g @copycat_git_support 'on'

# Prefix Highlight
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_copy_mode_attr 'fg=white,bg=yellow,bold'
set -g @prefix_highlight_empty_attr 'fg=black,bg=white,bold'
set -g @prefix_highlight_empty_prompt 'waiting...'
set -g @prefix_highlight_fg 'black'
set -g @prefix_highlight_bg 'yellow'

# Mode Indicator
set -g @mode_indicator_prefix_prompt ' WAIT '
set -g @mode_indicator_copy_prompt ' COPY '
set -g @mode_indicator_sync_prompt ' SYNC '
set -g @mode_indicator_empty_prompt ' TMUX '
set -g @mode_indicator_prefix_mode_style 'fg=black,bg=yellow,bold'
set -g @mode_indicator_copy_mode_style 'fg=black,bg=green,bold'
set -g @mode_indicator_sync_mode_style 'fg=black,bg=red,bold'
set -g @mode_indicator_empty_mode_style 'fg=default,bg=default'

# Sidebar
set -g @sidebar-tree-command 'tree -C'

# Notify
set -g @notify-plugins 'battery cpu'
set -g @notify-threshold '50'
set -g @notify-script '#{pane_current_path}/.tmux/notify.sh'

# Battery
set -g @battery_icon_charge_tier8 '󰁹'
set -g @battery_icon_charge_tier7 '󰂁'
set -g @battery_icon_charge_tier6 '󰂁'
set -g @battery_icon_charge_tier5 '󰂀'
set -g @battery_icon_charge_tier4 '󰂀'
set -g @battery_icon_charge_tier3 '󰁿'
set -g @battery_icon_charge_tier2 '󰁾'
set -g @battery_icon_charge_tier1 '󰁽'
set -g @battery_icon_status_charged '󰂄'
set -g @battery_icon_status_charging '󰂄'

# CPU
set -g @cpu_low_icon '󰾅'
set -g @cpu_medium_icon '󰾆'
set -g @cpu_high_icon '󰾇'

# Online Status
set -g @online_icon '󰤨'
set -g @offline_icon '󰤭'