#!/usr/bin/env bash
# Session helpers that ignore popup scratch sessions (scratch-*).
#   tmux-sessions.sh next|prev   cycle through project sessions
#   tmux-sessions.sh kill        kill current session and its scratch

current=$(tmux display-message -p "#S")
[[ "$current" =~ ^scratch- ]] && exit

projects() {
    tmux list-sessions -F "#{session_name}" | grep -v '^scratch-'
}

case "$1" in
next | prev)
    mapfile -t list < <(projects)
    n=${#list[@]}
    for i in "${!list[@]}"; do
        [[ "${list[$i]}" == "$current" ]] && break
    done
    [[ "$1" == next ]] && j=$(((i + 1) % n)) || j=$(((i - 1 + n) % n))
    tmux switch-client -t "=${list[$j]}"
    ;;
kill)
    id=$(tmux display-message -p "#{session_id}")
    other=$(projects | grep -vxF "$current" | head -n1)
    if [[ -n "$other" ]]; then
        tmux switch-client -t "=$other"
    fi
    tmux kill-session -t "=scratch-${id#\$}" 2>/dev/null
    tmux kill-session -t "=$current"
    ;;
esac
