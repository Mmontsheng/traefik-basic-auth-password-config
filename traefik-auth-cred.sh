#!/bin/bash
while true; do
    read -p "Set your username for traefik panel: " username
    echo
    if [[ ${#username} -ge 5 ]]; then
        break
    else
        echo "Username must contain at least 5 characters"
    fi
done
while true; do
    read -s -p "Set your password for traefik panel: " passwd
    echo
    if [[ ${#passwd} -ge 8 ]]; then
        data=$(htpasswd -nbB $username $passwd)
        ESCAPED_DATA=$(printf '%s\n' "$data" | sed -e 's/[\/&]/\\&/g')
        echo "Username and password is: "
        echo $ESCAPED_DATA
        break
    else
        echo "Password must contain at least 8 characters"
    fi
done
