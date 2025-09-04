#!/usr/bin/env bash
if playerctl status 2>/dev/null | grep -q "Playing"; then
    playerctl metadata title
else
    echo "silence"
fi
