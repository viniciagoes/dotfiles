#!/bin/bash

######## KITTY THEME

# Define the directory to scan
DIR="/home/mojito/dotfiles/.config/kitty"

FILE1=$(find "$DIR" -name "kitty.conf")
FILE2=$(find "$DIR" -name "_kitty.conf")

KITTY_CUR_CONF=$(head -1 "$FILE1")

# Check if both files are found
if [ -z "$FILE1" ] || [ -z "$FILE2" ]; then
    echo "One or both files not found."
    exit 1
fi

# Function to swap file names
swap_files() {
    TEMPFILE="${DIR}/temp_swap_file.txt"
    mv "$FILE1" "$TEMPFILE"
    mv "$FILE2" "$FILE1"
    mv "$TEMPFILE" "$FILE2"
}

if [[ "$KITTY_CUR_CONF" == *"LIGHT"* && "$1" == "dark" ]]; then
    swap_files
elif [[ "$KITTY_CUR_CONF" == *"DARK"* && "$1" == "light" ]]; then
    swap_files
fi

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
if [[ "$CURRENT_THEME" == "$DARK_THEME" && "$1" == "light" ]]; then
    NEW_THEME="$LIGHT_THEME"
    jq --arg theme "$NEW_THEME" '.["workbench.colorTheme"] = $theme' "$SETTINGS_PATH.bak" > "$SETTINGS_PATH"
elif [[ "$CURRENT_THEME" == "$LIGHT_THEME" && "$1" == "dark" ]]; then
    NEW_THEME="$DARK_THEME"
    jq --arg theme "$NEW_THEME" '.["workbench.colorTheme"] = $theme' "$SETTINGS_PATH.bak" > "$SETTINGS_PATH"
fi

######## HYPRLAND/WAYBAR THEME
DIR="/home/mojito/dotfiles/.config/waybar"

FILE1=$(find "$DIR" -name "style.css")
FILE2=$(find "$DIR" -name "_style.css")

WAYBAR_CUR_CONF=$(head -1 "$FILE1")

# Check if both files are found
if [ -z "$FILE1" ] || [ -z "$FILE2" ]; then
    echo "One or both files not found."
    exit 1
fi

if [[ "$WAYBAR_CUR_CONF" == *"LIGHT"* && "$1" == "dark" ]]; then
    swap_files
elif [[ "$WAYBAR_CUR_CONF" == *"DARK"* && "$1" == "light" ]]; then
    swap_files
fi

killall -SIGUSR2 waybar
hyprctl reload

######## WOFI THEME
DIR="/home/mojito/dotfiles/.config/wofi"

FILE1=$(find "$DIR" -name "style.css")
FILE2=$(find "$DIR" -name "_style.css")

WOFI_CUR_CONF=$(head -1 "$FILE1")

# Check if both files are found
if [ -z "$FILE1" ] || [ -z "$FILE2" ]; then
    echo "One or both files not found."
    exit 1
fi

if [[ "$WOFI_CUR_CONF" == *"LIGHT"* && "$1" == "dark" ]]; then
    swap_files
elif [[ "$WOFI_CUR_CONF" == *"DARK"* && "$1" == "light" ]]; then
    swap_files
fi

