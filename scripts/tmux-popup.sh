#!/usr/bin/env bash
session=$(tmux display-message -pF "#S")
window=$(tmux display-message -pF "#I")
path=$(tmux display-message -pF "#{pane_current_path}")
scratch="scratch-${session}-${window}"

if [[ "$session" =~ ^scratch- ]]; then
    tmux detach-client
    exit
fi

tmux display-popup -E -w 90% -h 80% -b rounded -d "$path" \
    "tmux new-session -A -s \"$scratch\""
