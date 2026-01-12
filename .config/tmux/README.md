# Tmux Configuration

Modular tmux configuration located in `~/.config/tmux/`.

## Structure

```
~/.config/tmux/
├── tmux.conf          # Main config file (sources all modules)
├── options.tmux       # General options and settings
├── keybindings.tmux   # All keybindings
├── vim-integration.tmux # Vim/tmux integration
├── statusbar.tmux     # Status bar configuration
├── plugins.tmux       # Plugin manager and plugins
├── tpm/               # Tmux Plugin Manager
└── README.md          # This file
```

## Installation

1. The config is automatically loaded via symlink: `~/.tmux.conf -> ~/.config/tmux/tmux.conf`

2. Install plugins:
   - Start tmux
   - Press `prefix + I` (capital I) to install plugins
   - Wait for installation to complete

3. Reload config:
   - Press `prefix + r` to reload configuration

## Keybindings

### Prefix
- Default prefix: `Ctrl+a`

### Pane Management
- `prefix + |` - Split window horizontally
- `prefix + -` - Split window vertically
- `prefix + h/j/k/l` - Navigate panes
- `prefix + H/J/K/L` - Resize panes
- `prefix + >` - Swap pane down
- `prefix + <` - Swap pane up
- `prefix + x` - Kill pane
- `prefix + +` - Maximize/minimize pane

### Window Management
- `prefix + c` - New window
- `prefix + &` - Kill window
- `prefix + Space` - Last window
- `prefix + ,` - Rename window
- `prefix + t` - Choose tree

### Session Management
- `prefix + S` - Choose session
- `prefix + $` - Rename session
- `prefix + d` - Detach client

### Copy Mode (Vim-style)
- `prefix + Escape` - Enter copy mode
- `v` - Begin selection
- `y` - Copy selection
- `r` - Rectangle toggle
- `/` - Search forward
- `?` - Search backward

### Vim Integration
- `Ctrl+h/j/k/l` - Smart pane switching (passes through to vim if in vim)
- Works seamlessly with vim splits

### Plugins
- `prefix + I` - Install plugins
- `prefix + U` - Update plugins
- `prefix + alt + u` - Uninstall plugins

## Plugins

### Essential
- **tmux-sensible** - Sensible defaults
- **tmux-resurrect** - Save/restore sessions
- **tmux-continuum** - Auto-save/restore
- **vim-tmux-navigator** - Better vim/tmux integration
- **tmux-yank** - Better clipboard integration

### Pane & Window Management
- **tmux-pain-control** - Better pane resizing and management
- **tmux-open** - Open files/URLs from tmux
- **tmux-logging** - Log pane output to files
- **tmux-sidebar** - File browser sidebar

### System Monitoring
- **tmux-battery** - Battery status indicator
- **tmux-cpu** - CPU usage indicator
- **tmux-net-speed** - Network speed monitoring
- **tmux-online-status** - Online/offline status

### Copy & Search
- **tmux-copycat** - Enhanced copy mode with regex search
- **tmux-urlview** - Extract and open URLs from pane (requires `urlview` or `extract_url` - install with: `sudo pacman -S urlview`)

### UI Enhancements
- **tmux-prefix-highlight** - Highlight when prefix is pressed
- **tmux-mode-indicator** - Show current mode (copy/prefix/sync)
- **tmux-onedark-theme** - One Dark theme support
- **tmux-notify** - Desktop notifications

### Utilities
- **tmux-fzf** - Fzf integration for tmux
- **tmux-sessionist** - Better session management

## Customization

### Change Prefix
Edit `options.tmux`:
```tmux
set -g prefix C-Space  # or C-b, `, etc.
```

### Change Theme
Edit `statusbar.tmux` and uncomment alternative themes or customize colors.

### Add Keybindings
Add to `keybindings.tmux`:
```tmux
bind <key> <command>
```

### Add Plugins
Edit `plugins.tmux`:
```tmux
set -g @plugin 'username/plugin-name'
```

Then press `prefix + I` to install.

## Backup

Your old config is backed up at `~/.tmux.conf.backup`.

## Reloading

After making changes:
1. Save files
2. Press `prefix + r` in tmux
3. Or restart tmux

## Troubleshooting

### Plugins not working
1. Make sure TPM is installed: `ls ~/.config/tmux/tpm`
2. Install plugins: `prefix + I`
3. Check plugin directory: `ls ~/.config/tmux/plugins`

### Plugin dependencies
Some plugins require external tools:
- **tmux-urlview**: Requires `urlview` or `extract_url`
  - Install: `sudo pacman -S urlview` (Arch) or `sudo apt install urlview` (Debian/Ubuntu)
  - Then uncomment in `plugins.tmux`
- **tmux-fzf**: Requires `fzf` to be installed and in PATH
  - Install: `sudo pacman -S fzf` or `go install github.com/junegunn/fzf@latest`
- **tmux-open**: May require `xdg-open` (Linux) or `open` (macOS)

### Colors not working
Make sure your terminal supports 256 colors:
```bash
echo $TERM  # Should show something like screen-256color
```

### Vim integration not working
1. Make sure vim-tmux-navigator plugin is installed
2. Add to your vim config:
   ```vim
   Plug 'christoomey/vim-tmux-navigator'
   ```

## Resources

- [Tmux Manual](https://man.openbsd.org/tmux)
- [TPM GitHub](https://github.com/tmux-plugins/tpm)
- [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)
