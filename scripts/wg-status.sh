#!/bin/bash

get_status() {
    if nmcli con show --active | grep -q "wgp"; then
        echo '{"text": "", "class": "active"}'
    else
        echo '{"text": "", "class": "inactive"}'
    fi
}

# Вывод сразу при старте
get_status

# Следим за событиями NetworkManager
nmcli monitor | while read -r line; do
    # nmcli monitor выводит строку при каждом изменении соединения
    get_status
done
