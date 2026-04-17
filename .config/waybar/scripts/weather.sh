#!/bin/bash
# Weather module for Waybar using wttr.in

CITY=""

get_weather() {
	local data
	data=$(curl -s --max-time 10 "wttr.in/${CITY}?format=j1" 2>/dev/null)
	if [ $? -ne 0 ] || [ -z "$data" ]; then
		echo '{"text": "󰖐 --", "tooltip": "Offline", "class": "weather-offline"}'
		return
	fi

	local temp
	local condition
	temp=$(echo "$data" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['current_condition'][0]['temp_C'])")
	condition=$(echo "$data" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['current_condition'][0]['weatherDesc'][0]['value'])")

	local icon
	case "$condition" in
	Clear | Sunny) icon="󰖀" ;;
	*cloudy* | *Cloudy*) icon="󰖛" ;;
	Overcast) icon="󰖐" ;;
	Fog | Mist) icon="󰖑" ;;
	Rain | Drizzle) icon="󰖗" ;;
	Thunderstorm) icon="󰖝" ;;
	Snow | Sleet) icon="󰼜" ;;
	*) icon="󰖐" ;;
	esac

	echo "{\"text\": \"$icon ${temp}°C\", \"tooltip\": \"$condition\", \"class\": \"weather\"}"
}

get_weather
