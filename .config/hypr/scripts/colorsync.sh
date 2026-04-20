#!/usr/bin/env bash

HYPRPATH="$HOME/Pictures/wallpapers"
CACHEFILE="$HOME/.cache/wallpaper_colors"
SCHEMEFILE="$HOME/.config/hypr/scheme/current.conf"
WAYBARCOLORS="$HOME/.config/waybar/colors/dynamic.css"

mkdir -p "$(dirname "$WAYBARCOLORS")"

extract_color() {
	local img="$1"
	local num="$2"
	magick "$img" -resize 50x50! -depth 8 +dither -colors "$num" -format "%c" histogram:info: 2>/dev/null |
		grep -oE '#[0-9a-fA-F]{6}' | head -"$num" | tail -1 | cut -c2-
}

get_primary_color() {
	local img="$1"
	extract_color "$img" 5 | head -1
}

get_secondary_color() {
	local img="$1"
	extract_color "$img" 8 | tail -1
}

get_bg_color() {
	local img="$1"
	magick "$img" -crop 1x1+0+0 +repage txt: 2>/dev/null | grep -oE '#[0-9a-fA-F]{6}' | cut -c2-
}

generate_scheme() {
	local bg="$1"
	local primary secondary tertiary bg_dark on_bg

	primary=$(get_primary_color "$bg")
	secondary=$(get_secondary_color "$bg")
	bg_dark=$(get_bg_color "$bg")

	on_bg="e5e1e7"
	[[ -n "$primary" ]] && on_bg="$primary"

	cat >"$SCHEMEFILE" <<EOF
# Auto-generated color scheme from wallpaper: $(basename "$bg")
\$primary_paletteKeyColor = ${primary:-7171ac}
\$secondary_paletteKeyColor = ${secondary:-76758e}
\$tertiary_paletteKeyColor = ${tertiary:-9e648e}
\$neutral_paletteKeyColor = 78767b
\$neutral_variant_paletteKeyColor = 777680
\$background = ${bg_dark:-131317}
\$onBackground = ${on_bg}
\$surface = ${bg_dark:-131317}
\$surfaceDim = ${bg_dark:-131317}
\$surfaceBright = 39393d
\$surfaceContainerLowest = 0e0e12
\$surfaceContainerLow = 1c1b1f
\$surfaceContainer = 201f23
\$surfaceContainerHigh = 2a292e
\$surfaceContainerHighest = 353438
\$onSurface = ${on_bg}
\$surfaceVariant = 47464f
\$onSurfaceVariant = c8c5d1
\$inverseSurface = ${on_bg}
\$inverseOnSurface = 313034
\$outline = 918f9a
\$outlineVariant = 47464f
\$shadow = 000000
\$scrim = 000000
\$surfaceTint = ${primary:-c2c1ff}
\$primary = ${primary:-c2c1ff}
\$onPrimary = 1e2d60
\$primaryContainer = ${primary:-7171ac}
\$onPrimaryContainer = ffffff
\$inversePrimary = 595992
\$secondary = ${secondary:-c6c4e0}
\$onSecondary = 2e2e44
\$secondaryContainer = 45455c
\$onSecondaryContainer = b4b2ce
\$tertiary = f5b2e0
\$onTertiary = 4e1e44
\$tertiaryContainer = bb7da9
\$onTertiaryContainer = 000000
\$error = ffb4ab
\$onError = 690005
\$errorContainer = 93000a
\$onErrorContainer = ffdad6
\$primaryFixed = e2dfff
\$primaryFixedDim = ${primary:-c2c1ff}
\$onPrimaryFixed = 14134a
\$onPrimaryFixedVariant = 414178
\$secondaryFixed = e2e0fd
\$secondaryFixedDim = ${secondary:-c6c4e0}
\$onSecondaryFixed = 19192e
\$onSecondaryFixedVariant = 45455c
\$tertiaryFixed = ffd7f0
\$tertiaryFixedDim = f5b2e0
\$onTertiaryFixed = 35082e
\$onTertiaryFixedVariant = 68355c
\$term0 = 353434
\$term1 = ac73ff
\$term2 = 44def5
\$term3 = ffdcf2
\$term4 = 99aad8
\$term5 = b49fea
\$term6 = 9dceff
\$term7 = e8d3de
\$term8 = ac9fa9
\$term9 = c093ff
\$term10 = 89ecff
\$term11 = fff0f6
\$term12 = b5c1dd
\$term13 = c9b5f4
\$term14 = bae0ff
\$term15 = ffffff
\$success = B5CCBA
\$onSuccess = 213528
\$successContainer = 374B3E
\$onSuccessContainer = D1E9D6
EOF
}

update_waybar() {
	local primary="$1"
	local bg="$2"

	# Calculate contrast - if bg is light, use dark text
	local bg_r bg_g bg_b
	bg_r=$((16#${bg:0:2})) bg_g=$((16#${bg:2:2})) bg_b=$((16#${bg:4:2}))
	local brightness=$(((bg_r * 299 + bg_g * 587 + bg_b * 114) / 1000))

	if [[ $brightness -gt 128 ]]; then
		# Light background - use dark text
		local text_color="1a1a2e"
		local muted_color="4a4a5e"
	else
		# Dark background - use light text
		local text_color="e0def4"
		local muted_color="9a9aae"
	fi

	cat >"$HOME/.config/waybar/style.css" <<EOF
/* ── Dynamic colors from wallpaper ───────────────── */
@define-color base    #${bg};
@define-color surface #${bg};
@define-color overlay #${primary};
@define-color muted   #${muted_color};
@define-color subtle  #${primary};
@define-color text    #${text_color};
@define-color love    #eb6f92;
@define-color gold    #${primary};
@define-color rose    #${primary};
@define-color pine    #${primary};
@define-color foam    #${primary};
@define-color iris    #${primary};

/* ── Reset ─────────────────────────────────────── */
* {
    font-family: "JetBrainsMono Nerd Font", "Symbols Nerd Font", monospace;
    font-size: 11px;
    min-height: 0;
    border: none;
    border-radius: 0;
    box-shadow: none;
    transition: background-color 150ms ease, color 150ms ease;
}

window#waybar {
    background: alpha(@base, 0.92);
    color: @text;
    border-radius: 0;
    box-shadow: 0 2px 10px alpha(#000000, 0.4);
}

.modules-left, .modules-center, .modules-right {
    padding: 0 4px;
}

#workspaces, #clock, #group-stats, #pulseaudio, #backlight, #battery, #tray {
    margin: 2px 2px;
    border-radius: 0;
    padding: 0 8px;
    background: alpha(@surface, 0.75);
}

#workspaces, #hyprland-workspaces { padding: 0 2px; }

#workspaces button, #hyprland-workspaces button {
    padding: 0 6px;
    margin: 2px 1px;
    color: @muted;
    background: alpha(@surface, 0.5);
    border-radius: 4px;
    font-size: 11px;
    font-weight: bold;
    min-height: 0;
    border: none;
    transition: all 0.2s ease;
}

#workspaces button.empty, #hyprland-workspaces button.empty {
    background: transparent;
    color: @subtle;
}

#workspaces button.active, #workspaces button.focused, #hyprland-workspaces button.active, #hyprland-workspaces button.focused {
    background: @rose;
    color: @base;
}

#workspaces button.visible, #hyprland-workspaces button.visible {
    border-bottom: 2px solid @rose;
}

#workspaces button.urgent, #hyprland-workspaces button.urgent {
    color: @love;
}

#clock {
    color: @rose;
    font-weight: bold;
    letter-spacing: 0.3px;
}

#clock:hover { background: @overlay; color: @text; }

#group-stats {
    background: alpha(@surface, 0.75);
    padding: 0 6px;
}

#group-stats:hover { background: @overlay; }

#cpu, #memory, #temperature {
    padding: 0 4px;
    background: transparent;
    font-weight: 600;
}

#cpu, #memory, #temperature, #wireplumber, #wireplumber.source, #wireplumber.sink,
#backlight, #battery, #custom-weather {
    color: @rose;
}

#temperature.critical { color: @love; animation: blink 1s step-start infinite; }

#wireplumber:hover  { background: @overlay; }
#wireplumber.muted  { color: @muted; }
#wireplumber {
    padding-top: 0;
    margin-top: 0;
    font-size: 10px;
}

#backlight:hover { background: @overlay; }

#battery:hover    { background: @overlay; }
#battery.charging { color: @rose; }
#battery.good     { color: @rose; }
#battery.warning  { color: @rose; }
#battery.critical { color: @love; animation: blink 1s step-start infinite; }

#tray { padding: 0 6px; }
#tray:hover { background: @overlay; }
#tray > .passive { -gtk-icon-effect: dim; }
#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background: alpha(@love, 0.2);
    border-radius: 0;
}

@keyframes blink { 50% { opacity: 0.35; } }

#custom-weather:hover { background: @overlay; }
#custom-weather.weather-offline { color: @muted; }
EOF

	killall waybar
	sleep 1
	waybar &
}

update_ghostty() {
	local primary="$1"
	local bg="$2"
	mkdir -p "$HOME/.cache"
	cat >"$CACHEFILE" <<EOF
export WALLPAPER_PRIMARY=#${primary}
export WALLPAPER_BG=#${bg}
EOF
}

reload_hyprland() {
	hyprctl reload
}

pick_random_wallpaper() {
	local count=0
	local -a files
	for f in "$HYPRPATH"/*.{jpg,jpeg,png,webp,gif}; do
		[[ -e "$f" ]] && files[count]="$f" && ((count++))
	done
	[[ count -eq 0 ]] && return 1
	local idx=$((RANDOM % count))
	echo "${files[idx]}"
}

run_once() {
	wp=$(pick_random_wallpaper) || return 1
	primary=$(get_primary_color "$wp")
	secondary=$(get_secondary_color "$wp")
	bg=$(get_bg_color "$wp")

	# Set wallpaper in hyprpaper
	hyprctl hyprpaper preload "$wp" 2>/dev/null
	hyprctl hyprpaper wallpaper "eDP-1,$wp" 2>/dev/null

	generate_scheme "$wp"
	update_waybar "$primary" "$bg"
	update_ghostty "$primary" "$bg"
	reload_hyprland
	echo "Updated theme from $(basename "$wp"): primary=#$primary bg=#$bg"
}

watch_loop() {
	local current=""
	while true; do
		sleep 30

		wp=$(pick_random_wallpaper) || continue
		[[ -z "$wp" || "$wp" == "$current" ]] && continue

		current="$wp"
		primary=$(get_primary_color "$wp")
		secondary=$(get_secondary_color "$wp")
		bg=$(get_bg_color "$wp")

		hyprctl hyprpaper preload "$wp" 2>/dev/null
		hyprctl hyprpaper wallpaper "eDP-1,$wp" 2>/dev/null

		generate_scheme "$wp"
		update_waybar "$primary" "$bg"
		update_ghostty "$primary" "$bg"
		reload_hyprland
		echo "$(date): Updated theme from $(basename "$wp")"
	done
}

case "$1" in
once)
	run_once
	;;
watch)
	watch_loop
	;;
*)
	echo "Usage: $0 {once|watch}"
	;;
esac
