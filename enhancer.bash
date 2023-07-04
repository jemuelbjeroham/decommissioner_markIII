#!/bin/bash

input_file="input.txt"
output_file="new_input.txt"

if [ -f "$input_file" ]; then
    if [ -f "$output_file" ]; then
        rm "$output_file"
    fi

    touch "$output_file"

    while IFS= read -r line; do
        if [[ $line =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            echo "$line" >> "$output_file"
            echo "$line/32" >> "$output_file"
        else
            echo "$line" >> "$output_file"
        fi
    done < "$input_file"

    echo "New input file created: $output_file"

    ./formatter.bash "$output_file"
else
    echo "Input file not found."
fi
