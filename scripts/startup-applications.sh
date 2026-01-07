#!/usr/bin/env bash

# Function to check if app is running
is_running() {
    pgrep -x "$1" > /dev/null 2>&1
}

# Launch app if not running
launch_if_not_running() {
    local process_name=$1
    local workspace=$2
    local command=$3
    
    if ! is_running "$process_name"; then
        swaymsg "workspace $workspace; exec $command"
    fi
}

# Launch applications
launch_if_not_running "chromium-browser" "1" "chromium-browser"
launch_if_not_running "code" "1" "code"
launch_if_not_running "foot" "2" "foot"
launch_if_not_running ".podman-desktop" "2" "flatpak run io.podman_desktop.PodmanDesktop"
launch_if_not_running "slack" "3" "flatpak run com.slack.Slack"
launch_if_not_running "teams-for-linux" "3" "teams-for-linux"
# Outlook web app as Chrome PWA - requires specific process check
if ! pgrep -f "chrome-faolnafnngnfdaknnbpnkhgohbobgegn" > /dev/null 2>&1; then
    swaymsg "workspace 3; exec chromium-browser --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn"
fi
launch_if_not_running "firefox" "4" "firefox"
launch_if_not_running "spotify" "5" "flatpak run com.spotify.Client"