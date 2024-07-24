#!/bin/bash

# Define the directory to scan
DIRECTORY="/home/mojito/.config/kitty"

# Find the files and store their paths in variables
FILE1=$(find "$DIRECTORY" -name "kitty.conf")
FILE2=$(find "$DIRECTORY" -name "_kitty.conf")

# Check if both files are found
if [ -z "$FILE1" ] || [ -z "$FILE2" ]; then
    echo "One or both files not found."
    exit 1
fi

# Function to swap file names
swap_files() {
    TEMPFILE="${DIRECTORY}/temp_swap_file.txt"
    mv "$FILE1" "$TEMPFILE"
    mv "$FILE2" "$FILE1"
    mv "$TEMPFILE" "$FILE2"
}

# Swap the files
swap_files

# Execute the command
#your_command arg1 arg2
