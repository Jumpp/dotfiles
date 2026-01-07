#!/usr/bin/env bash

# Get list of windows in scratchpad
scratchpad_windows=$(swaymsg -t get_tree | jq -r '
  recurse(.nodes[]?, .floating_nodes[]?) |
  select(.name == "__i3_scratch") |
  recurse(.floating_nodes[]?) |
  select(.name != null and .name != "__i3_scratch") |
  select((.app_id // .window_properties.class // "") != "org.kde.xwaylandvideobridge") |
  "\(.id) - \(.name)"
')

# Check if scratchpad is empty
if [ -z "$scratchpad_windows" ]; then
    notify-send "Scratchpad" "Scratchpad is empty"
    exit 0
fi

# Show rofi menu and get selection
selected=$(echo "$scratchpad_windows" | rofi -dmenu -i -p "Scratchpad" -format "s")

# Exit if nothing selected
if [ -z "$selected" ]; then
    exit 0
fi

# Extract window ID from selection (first number before the dash)
window_id=$(echo "$selected" | grep -oP '^\d+')

# Show the selected window
if [ -n "$window_id" ]; then
    swaymsg "[con_id=$window_id] scratchpad show"
fi
