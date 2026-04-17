#!/usr/bin/env bash
# Workspace module for waybar - works with both niri and hyprland

if pgrep -x Hyprland >/dev/null 2>&1; then
	active=$(hyprctl activeworkspace -j 2>/dev/null | jq -r '.id')

	# Build output manually with JSON and class for styling
	result="["
	first=true
	while IFS= read -r ws; do
		[ -z "$ws" ] && continue
		if [ "$first" = "true" ]; then
			first=false
		else
			result="${result},"
		fi
		if [ "$ws" = "$active" ]; then
			result="${result}{\"text\":\"${ws}\",\"class\":\"focused\"}"
		else
			result="${result}{\"text\":\"${ws}\"}"
		fi
	done < <(hyprctl workspaces -j 2>/dev/null | jq -r '.[] | select(.id <= 10) | .id | tostring' | sort -n)
	result="${result}]"

	if [ "$result" = "[]" ]; then
		echo '[{"text":"1","class":"focused"}]'
	else
		echo "$result"
	fi
else
	echo '[{"text":"1"}]'
fi
