#!/usr/bin/env bash

OUTPUT_HTML="$HOME/config-hyprland.html"

# Define variables directly from hyprland config
kbLauncher="Super+Space"
kbLauncherClip="Super+V"
kbLauncherEmoji="Super+."
kbTerminal="Super+T"
kbBrowser="Super+B"
kbEditor="Super+E"
kbIde="Super+I"
kbFiles="Super+N"
kbGoToWs="Super"
kbMoveToWs="Super+Shift"
kbClose="Super+Q"
kbFullscreen="Super+F"
kbPin="Super+P"
kbFloat="Super+S"
kbLock="Ctrl+Alt+L"
kbScreenshot="Print"

terminal="ghostty"
browser="chrome"
editor="neovide"
ide="zeditor"
fileExplorer="yazi"

# Create HTML
cat > "$OUTPUT_HTML" << EOF
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hyprland Keybinds</title>
<style>
body { font-family: monospace; background: #1a1b26; color: #c0caf5; padding: 20px; max-width: 900px; margin: 0 auto; }
h1 { color: #7aa2f7; border-bottom: 2px solid #7aa2f7; }
h2 { color: #bb9af7; margin-top: 25px; }
table { width: 100%; border-collapse: collapse; }
td { padding: 6px 10px; border-bottom: 1px solid #414868; }
td:first-child { color: #7dcfff; font-weight: bold; }
td:last-child { color: #9ece6a; }
.timestamp { color: #565f89; font-size: 0.9em; }
</style>
</head>
<body>
<h1>Hyprland Keybinds</h1>

<h2>LAUNCHER</h2>
<table>
<tr><td>$kbLauncher</td><td>exec fuzzel (app launcher)</td></tr>
<tr><td>$kbLauncherClip</td><td>exec fuzzel --dmenu (clipboard)</td></tr>
<tr><td>$kbLauncherEmoji</td><td>exec fuzzel --dmenu (emoji)</td></tr>
</table>

<h2>APPS</h2>
<table>
<tr><td>$kbTerminal</td><td>exec $terminal</td></tr>
<tr><td>$kbBrowser</td><td>exec $browser</td></tr>
<tr><td>$kbEditor</td><td>exec $editor</td></tr>
<tr><td>$kbIde</td><td>exec $ide</td></tr>
<tr><td>$kbFiles</td><td>exec yazi (file manager)</td></tr>
<tr><td>Super+Shift+E</td><td>exec emacsclient -c (Emacs)</td></tr>
</table>

<h2>WORKSPACES - Go To</h2>
<table>
<tr><td>$kbGoToWs+1</td><td>workspace 1</td></tr>
<tr><td>$kbGoToWs+2</td><td>workspace 2</td></tr>
<tr><td>$kbGoToWs+3</td><td>workspace 3</td></tr>
<tr><td>$kbGoToWs+4</td><td>workspace 4</td></tr>
<tr><td>$kbGoToWs+5</td><td>workspace 5</td></tr>
<tr><td>$kbGoToWs+6</td><td>workspace 6</td></tr>
<tr><td>$kbGoToWs+7</td><td>workspace 7</td></tr>
<tr><td>$kbGoToWs+8</td><td>workspace 8</td></tr>
<tr><td>$kbGoToWs+9</td><td>workspace 9</td></tr>
<tr><td>$kbGoToWs+0</td><td>workspace 10</td></tr>
<tr><td>$kbGoToWs+right</td><td>workspace +1 (next)</td></tr>
<tr><td>$kbGoToWs+left</td><td>workspace -1 (prev)</td></tr>
<tr><td>$kbGoToWs+mouse_down</td><td>workspace -1</td></tr>
<tr><td>$kbGoToWs+mouse_up</td><td>workspace +1</td></tr>
<tr><td>$kbGoToWs+Page_Down</td><td>workspace +1</td></tr>
<tr><td>$kbGoToWs+Page_Up</td><td>workspace -1</td></tr>
</table>

<h2>WORKSPACES - Move Window</h2>
<table>
<tr><td>$kbMoveToWs+1</td><td>movetoworkspace 1</td></tr>
<tr><td>$kbMoveToWs+2</td><td>movetoworkspace 2</td></tr>
<tr><td>$kbMoveToWs+3</td><td>movetoworkspace 3</td></tr>
<tr><td>$kbMoveToWs+4</td><td>movetoworkspace 4</td></tr>
<tr><td>$kbMoveToWs+5</td><td>movetoworkspace 5</td></tr>
<tr><td>$kbMoveToWs+6</td><td>movetoworkspace 6</td></tr>
<tr><td>$kbMoveToWs+7</td><td>movetoworkspace 7</td></tr>
<tr><td>$kbMoveToWs+8</td><td>movetoworkspace 8</td></tr>
<tr><td>$kbMoveToWs+9</td><td>movetoworkspace 9</td></tr>
<tr><td>$kbMoveToWs+0</td><td>movetoworkspace 10</td></tr>
</table>

<h2>SPECIAL WORKSPACES</h2>
<table>
<tr><td>Super+M</td><td>togglespecialworkspace music</td></tr>
<tr><td>Super+D</td><td>togglespecialworkspace music</td></tr>
</table>

<h2>WINDOW ACTIONS</h2>
<table>
<tr><td>$kbClose</td><td>killactive (close window)</td></tr>
<tr><td>$kbFullscreen</td><td>fullscreen</td></tr>
<tr><td>$kbPin</td><td>pin (always on top)</td></tr>
<tr><td>$kbFloat</td><td>togglefloating</td></tr>
</table>

<h2>WINDOW NAVIGATION</h2>
<table>
<tr><td>$kbGoToWs+h</td><td>movefocus l (left)</td></tr>
<tr><td>$kbGoToWs+l</td><td>movefocus r (right)</td></tr>
<tr><td>$kbGoToWs+k</td><td>movefocus u (up)</td></tr>
<tr><td>$kbGoToWs+j</td><td>movefocus d (down)</td></tr>
</table>

<h2>WINDOW MOVE</h2>
<table>
<tr><td>$kbMoveToWs+h</td><td>movewindow l (left)</td></tr>
<tr><td>$kbMoveToWs+l</td><td>movewindow r (right)</td></tr>
<tr><td>$kbMoveToWs+k</td><td>movewindow u (up)</td></tr>
<tr><td>$kbMoveToWs+j</td><td>movewindow d (down)</td></tr>
</table>

<h2>MOUSE (in window)</h2>
<table>
<tr><td>Super+mouse:272</td><td>movewindow (drag)</td></tr>
<tr><td>Super+mouse:273</td><td>resizewindow</td></tr>
</table>

<h2>SCREENSHOT</h2>
<table>
<tr><td>$kbScreenshot</td><td>exec grim -g "$(slurp)" - | wl-copy</td></tr>
<tr><td>Super+Shift+S</td><td>exec grim -g "$(slurp -f '%o')" - | wl-copy (to file)</td></tr>
</table>

<h2>MEDIA</h2>
<table>
<tr><td>XF86AudioPlay</td><td>exec playerctl play-pause</td></tr>
<tr><td>XF86AudioNext</td><td>exec playerctl next</td></tr>
<tr><td>XF86AudioPrev</td><td>exec playerctl previous</td></tr>
<tr><td>XF86AudioMute</td><td>exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle</td></tr>
<tr><td>XF86AudioRaiseVolume</td><td>exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+</td></tr>
<tr><td>XF86AudioLowerVolume</td><td>exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-</td></tr>
</table>

<h2>BRIGHTNESS</h2>
<table>
<tr><td>XF86MonBrightnessUp</td><td>exec brightnessctl set +5%</td></tr>
<tr><td>XF86MonBrightnessDown</td><td>exec brightnessctl set 5%-</td></tr>
</table>

<h2>SYSTEM</h2>
<table>
<tr><td>$kbLock</td><td>exec hyprlock</td></tr>
<tr><td>Super+W</td><td>exec colorsync.sh once (wallpaper)</td></tr>
<tr><td>F1</td><td>exec gen-config-pdf.sh (this help)</td></tr>
<tr><td>Super+Shift+O</td><td>exec systemctl poweroff</td></tr>
<tr><td>Super+Shift+R</td><td>exec systemctl reboot</td></tr>
<tr><td>Super+Shift+L</td><td>exec systemctl suspend</td></tr>
</table>

<p class="timestamp">Generated: $(date)</p>
</body>
</html>
EOF

xdg-open "$OUTPUT_HTML"