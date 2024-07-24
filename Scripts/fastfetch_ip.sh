#!/bin/bash

# Directory containing the images
IMAGE_DIR="/home/mojito/Scripts/fastfetch_logos"
# File to be modified
TARGET_FILE="/home/mojito/.config/fastfetch/config.jsonc"

# Pick a random image from the directory
RANDOM_IMAGE=$(find "$IMAGE_DIR" -type f | shuf -n 1)

# Copy the path of the random image
IMAGE_PATH="$RANDOM_IMAGE"

# Modify the target JSON file
# Create a backup of the original file
cp "$TARGET_FILE" "$TARGET_FILE.bak"

# Use jq to update the "source" field inside the "logo" tag
jq --arg newPath "$IMAGE_PATH" '.logo.source = $newPath' "$TARGET_FILE.bak" > "$TARGET_FILE"

# Execute the command
fastfetch

# Clean up
rm "$TARGET_FILE.bak"
