#!/usr/bin/env bash
status=$(playerctl status 2>/dev/null | tr -d '\n' | tr -d ' ')
if [[ "$status" == "Playing" ]]; then
    playerctl metadata title
else
    echo "silence"
fi
