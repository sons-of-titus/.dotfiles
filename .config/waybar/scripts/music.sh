#!/bin/bash
# Music module for Waybar using playerctl

get_music() {
	local player
	local status
	local title
	local artist
	local icon

	player=$(playerctl -l 2>/dev/null | grep -E "spotify|firefox|chromium|mpv|vlc|brave" | head -1)

	if [ -z "$player" ]; then
		echo '{"text": "󰝛 --", "tooltip": "No player", "class": "music-offline"}'
		return
	fi

	status=$(playerctl -p "$player" status 2>/dev/null)
	title=$(playerctl -p "$player" metadata title 2>/dev/null | cut -c1-40)
	artist=$(playerctl -p "$player" metadata artist 2>/dev/null | cut -c1-20)

	case "$status" in
	Playing) icon="󰐊" ;;
	Paused) icon="󰏤" ;;
	*) icon="󰝛" ;;
	esac

	if [ -z "$title" ]; then
		echo '{"text": "󰝛 --", "tooltip": "No track", "class": "music-offline"}'
		return
	fi

	if [ -n "$artist" ]; then
		echo "{\"text\": \"$icon $artist - $title\", \"tooltip\": \"$status\", \"class\": \"music-$status\"}"
	else
		echo "{\"text\": \"$icon $title\", \"tooltip\": \"$status\", \"class\": \"music-$status\"}"
	fi
}

get_music
