#!/bin/bash

file_name="new_input.txt"
vars_file="vars.yml"

if [ -f "$file_name" ]; then
    ip_list=()

    while IFS= read -r line; do
        ip=$(echo "$line" | xargs)
        ip_list+=("$ip")
    done < "$file_name"

    formatted_list=$(printf "'%s', " "${ip_list[@]}")
    formatted_list="[${formatted_list%, }]"

    sed -i "s|^ip_addrs:.*|ip_addrs: $formatted_list|" "$vars_file"
    echo "$vars_file has been updated with the IP addresses and FQDNs provided..."
else
    echo "File not found."
fi
