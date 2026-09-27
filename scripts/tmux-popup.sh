#!/usr/bin/env bash
# One scratch session per project session, keyed by the stable session id.
session=$(tmux display-message -pF "#S")
id=$(tmux display-message -pF "#{session_id}")
path=$(tmux display-message -pF "#{pane_current_path}")
scratch="scratch-${id#\$}"

if [[ "$session" =~ ^scratch- ]]; then
    tmux detach-client
    exit
fi

if ! tmux has-session -t "=$scratch" 2>/dev/null; then
    tmux new-session -d -s "$scratch" -c "$path"
    tmux set -t "$scratch" status-left "#[bold]  scratch: $session  "
    tmux set -t "$scratch" status-right "%H:%M "
fi

tmux display-popup -E -w 90% -h 80% -b rounded -d "$path" \
    "tmux attach-session -t \"=$scratch\""
