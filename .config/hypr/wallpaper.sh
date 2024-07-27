#!/usr/bin/bash

hour="$(date +"%k")"

# Convert hour to integer for comparison
hour_num=$(echo "$hour" | tr -d '\n')

if [ "$hour_num" -ge 7 ] && [ "$hour_num" -lt 17 ]; then
    hyprpaper -c "/home/mojito/.config/hypr/hyprpaper_light.conf"
    /bin/bash /home/mojito/dotfiles/Scripts/change_theme.sh light
elif [ "$hour_num" -lt 7 ] || [ "$hour_num" -ge 17 ]; then
    hyprpaper -c "/home/mojito/.config/hypr/hyprpaper_dark.conf"
    /bin/bash /home/mojito/dotfiles/Scripts/change_theme.sh dark
fi