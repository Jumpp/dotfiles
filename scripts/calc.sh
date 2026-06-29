#!/bin/bash

# Calculator using rofi and qalc
history=""

while true; do
    if [ -n "$history" ]; then
        expression=$(echo -e "$history" | rofi -dmenu -p "calculator" -format "s")
    else
        expression=$(rofi -dmenu -p "calculator" -format "s")
    fi
    
    # Exit if empty or cancelled
    [ -z "$expression" ] && break
    
    # If selecting from history, extract the expression part (before " = ")
    if [[ "$expression" == *" = "* ]]; then
        expression="${expression%% = *}"
    fi

    # Calculate result
    result=$(qalc "$expression" 2>&1 | grep -E "^[^>]" | tail -n 1)
    
    # Add to history
    if [ -n "$history" ]; then
        history="$result\n$history"
    else
        history="$result"
    fi
done
