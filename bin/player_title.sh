#!/bin/bash

output=$(playerctl metadata --format='{{ artist }} - {{ title }}')

# If no player found, exit silently
if [[ "$output" == "No players found" ]]; then
  exit 0
fi

# Trim spaces
output=$(echo "$output" | xargs)

# Return if empty after trim
if [[ -z "$output" ]]; then
  exit 0
fi

# If starts with " - ", strip it
if [[ $output == " - "* ]]; then
  cleaned="${output:3}"
else
  cleaned="$output"
fi

echo " $cleaned"
