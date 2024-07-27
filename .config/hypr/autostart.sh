#!/usr/bin/bash

# Policy Authentication Agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)

# https://wiki.hyprland.org/FAQ/#some-of-my-apps-take-a-really-long-time-to-open
# https://gist.github.com/PowerBall253/2dea6ddf6974ba4e5d26c3139ffb7580
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP --all &

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh

# gsettings
#gsettings set org.gnome.desktop.interface gtk-theme 'Tokyonight-Dark-BL-LB'
gsettings set org.gnome.desktop.interface font-name 'JetBrainsMonoNL Nerd Font Propo Semi-Bold 11'
gsettings set org.gnome.desktop.interface icon-theme 'Qogir'
gsettings set org.gnome.desktop.interface cursor-theme 'Qogir'

gsettings set org.gnome.desktop.default-applications.terminal exec kitty

# notification daemon
dunst &

# other
hyprctl setcursor Qogir-light 20
notify-send -a Hyprland "hello $(whoami)" 

sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &