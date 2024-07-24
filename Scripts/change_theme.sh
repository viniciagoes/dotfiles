#!/bin/bash

######## KITTY THEME

# Define the directory to scan
KITTY_SETTINGS="/home/mojito/dotfiles/.config/kitty"

# Find the files and store their paths in variables
FILE1=$(find "$KITTY_SETTINGS" -name "kitty.conf")
FILE2=$(find "$KITTY_SETTINGS" -name "_kitty.conf")

# Check if both files are found
if [ -z "$FILE1" ] || [ -z "$FILE2" ]; then
    echo "One or both files not found."
    exit 1
fi

# Function to swap file names
swap_files() {
    TEMPFILE="${KITTY_SETTINGS}/temp_swap_file.txt"
    mv "$FILE1" "$TEMPFILE"
    mv "$FILE2" "$FILE1"
    mv "$TEMPFILE" "$FILE2"
}

# Swap the files
swap_files

######## VSCODE THEME

# Define the path to the settings.json file
SETTINGS_PATH="/home/mojito/dotfiles/.config/VSCodium/User/settings.json"

# Define the themes to switch between
DARK_THEME="Gruvbox Dark Medium"
LIGHT_THEME="Gruvbox Light Soft"

# Backup the existing settings.json file
cp "$SETTINGS_PATH" "$SETTINGS_PATH.bak"

# Get the current theme using jq
CURRENT_THEME=$(jq -r '.["workbench.colorTheme"]' "$SETTINGS_PATH")

# Determine the new theme based on the current theme
if [ "$CURRENT_THEME" == "$DARK_THEME" ]; then
    NEW_THEME="$LIGHT_THEME"
elif [ "$CURRENT_THEME" == "$LIGHT_THEME" ]; then
    NEW_THEME="$DARK_THEME"
else
    # echo "Current theme is not recognized. No changes made."
    exit 1
fi

# Update the theme in settings.json
jq --arg theme "$NEW_THEME" '.["workbench.colorTheme"] = $theme' "$SETTINGS_PATH.bak" > "$SETTINGS_PATH"

######## HYPRLAND THEME
#your_command arg1 arg2
