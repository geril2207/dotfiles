#!/bin/bash

output=$(playerctl metadata --format='{{ artist }} - {{ title }}' 2>/dev/null)
output=$(xargs <<<"$output")

if [[ "$output" == "No players found" || "$output" == "No player could handle this command" ]]; then
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
