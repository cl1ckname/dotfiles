#!/bin/bash

SERVICE="kmonad"

case $1 in
    "toggle")
        if systemctl --user is-active --quiet "$SERVICE"; then
            systemctl --user stop "$SERVICE"
        else
            systemctl --user start "$SERVICE"
        fi
        sleep 1
        ;;
    "status")
        if systemctl --user is-active --quiet "$SERVICE"; then
            echo '{"text": "󰌌", "class": "running", "tooltip": "Kmonad: Running"}'
        else
            echo '{"text": "󰌌", "class": "stopped", "tooltip": "Kmonad: Stopped"}'
        fi
        ;;
esac
