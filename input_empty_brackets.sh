#!/bin/bash

# Directory to search for files
directory="./_posts"

# String to insert into empty brackets
inserted_text="alt-text"

# Find files in the directory and its subdirectories
find "$directory" -type f -print0 | while IFS= read -r -d $'\0' file; do
    # Check if the file contains empty brackets
    if grep -q '\[\]' "$file"; then
        # Replace empty brackets with [hello]
        sed -i 's/\[\]/['"$inserted_text"']/' "$file"
        echo "Inserted [hello] into $file"
    fi
done
