# Dotfiles

- [x] ZSH
- [x] SDDM
- [x] Kitty
- [ ] Hyprland
- [x] Scripts
- [x] Fastfetch
- [x] Grub

## Scripts

I wrote some scripts for better controling same system behaviours: 

- change_theme.sh - Automate system-wide theme change to be applied with task scheduling, light and dark mode. Dependencies: kitty, vscode (any variation), hyprland and other softwares related.

- fastfetch_ip.sh - After populated a folder full of images, all resized to 300x300 for my setup, automated image picker for fastfetch, whenever I launch a new terminal, a random picture is selected.

- [add-location-to-gnome-weather.sh from julianfairfax](https://gitlab.com/julianfairfax/scripts/-/blob/main/add-location-to-gnome-weather.sh)

```bash
# Automate system-wide (kitty, vscode and hyprland) theme change
~/Scripts/change_theme.sh

# Random image picker for fastfetch
~/Scripts/fastfetch_ip.sh

# Image folder for fastfetch
~/Scripts/fastfetch_logos
```

## 

## ZSH

I installed ZSH and oh-my-zsh for customization, plugins used:

- git 
- zsh-autosuggestions
- vscode
- colorize
- web-search

For the theme, I used oh-my-posh for creating a new theme based on the theme "pure". File directories:

```bash
# zsh
~/.zshrc

# oh-my-zsh
~/.oh-my-zsh

# oh-my-posh
~/.config/oh_my_posh/base.json
```

## Kitty

File directoy:

```bash
# Kitty dark-mode config
~/.config/Kitty/kitty.conf

# Kitty light-mode config
~/.config/Kitty/_kitty.conf
```

This file contains the settings for kitty terminal. No special settings were applied except for the colors. The color modes were inspired by [vscode-theme-gruvbox by jdinhify](https://github.com/jdinhify/vscode-theme-gruvbox):

- Kitty light mode - Gruvbox Light Hard
- Kitty dark mode - Gruvbox Dark Medium

The script for changing the terminal theme is present in [Scripts](#Scripts).

## Fastfetch

The fastfetch config contains only the modules I chose and the logo. The logo is changed with the help of a [script](#Scripts).

## SDDM

The theme for my lockscreen for sddm is [Sugar dark from MarianArlt](https://github.com/MarianArlt/sddm-sugar-dark). I alteres some thing such as some colors to better match the gruvbox theme and also changed the background.

## Grub

The grub theme I used was [ROG by hotaru-hspr](https://github.com/hotaru-hspr/rog-grub). I only changed the background.

## Hyprland