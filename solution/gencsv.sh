#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <start_index> <end_index>"
  exit 1
fi

start_index="$1"
end_index="$2"

if ! [[ "$start_index" =~ ^[0-9]+$ ]] || ! [[ "$end_index" =~ ^[0-9]+$ ]]; then
  echo "Both start_index and end_index must be non-negative integers."
  exit 1
fi

if [ "$start_index" -gt "$end_index" ]; then
  echo "start_index cannot be greater than end_index."
  exit 1
fi

filename="inputFile"

# Clear the file or create it if it doesn't exist
> "$filename"

for ((i = start_index; i <= end_index; i++)); do
  random_number=$((RANDOM % 1000))  # Generates a random number between 0 and 999
  echo "$i, $random_number" >> "$filename"
done

echo "CSV file '$filename' generated with entries from $start_index to $end_index."
