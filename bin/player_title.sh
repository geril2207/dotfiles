#!/bin/bash

output=$(playerctl metadata --format='{{ artist }} - {{ title }}')
output=$(echo "$output" | xargs)

if [[ "$output" == "No players found" ]]; then
  exit 0
fi

if [[ -z "$output" ]]; then
  exit 0
fi

if [[ $output == "- "* ]]; then
  cleaned="${output:2}"
else
  cleaned="$output"
fi

echo " $cleaned"
