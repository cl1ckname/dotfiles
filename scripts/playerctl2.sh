#!/usr/bin/env bash

update() {
    status=$(playerctl status 2>/dev/null)
    if [[ "$status" == "Playing" ]]; then
        playerctl metadata title 2>/dev/null
    else
        echo "silence"
    fi
}

update

# playerctl сам умеет следить за событиями
playerctl --follow metadata --format '{{status}}|{{title}}' 2>/dev/null \
| while IFS='|' read -r status title; do
    if [[ "$status" == "Playing" ]]; then
        echo "$title"
    else
        echo "silence"
    fi
done
