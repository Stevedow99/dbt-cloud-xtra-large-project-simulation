#!/bin/bash

# Set the base directory; default to current if not provided
BASE_DIR="${1:-.}"

# Use find to get all files, sort by depth to avoid renaming parent folders before children
find "$BASE_DIR" -depth -type f | while IFS= read -r file; do
    # Get directory and filename parts
    dir=$(dirname "$file")
    base=$(basename "$file")
    
    # Remove commas from the filename
    new_base="${base//,/}"

    # Only rename if the new name is different
    if [[ "$base" != "$new_base" ]]; then
        mv "$file" "$dir/$new_base"
        echo "Renamed: $file -> $dir/$new_base"
    fi
done