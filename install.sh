#!/bin/bash

echo "|------------------------------------------------------------------------|"
echo "|       HArtix - HnTR hyprland on artix linux installation script        |"
echo "|    This script will install and configure everything automatically     |"
echo "|------------------------------------------------------------------------|"

while :; do
    echo "Proceed? [Y/n]"
    read
    case "$REPLY" in
		[Yy]* | "" ) echo "Proceeding..."; break;;
		[Nn]* ) echo "Cancelling..."; exit;;
	esac
done

while :; do
	echo "Install requiret packages? [y/N]"
	case "$REPLY" in
		[Nn]* | "" ) break;;
		[Yy]* )
		yay -Sy hyprland hyprpaper hypridle hyprlock kitty nemo nemo-fileroller polkit-gnome copyq firefox waybar dunst gpu-screen-recorder-ui qpwgraph v2rayn easyeffects hyprlock lsp-pluginst-standalone ls-plugins-lv2 ttf-hack-nerd ttf-terminus-nerd ttf-profont-nerd rofi gnome-calculator pavucontrol gedit emote zsh pypewire wireplumber pypewire-pulse xdg-desktop-portal-hyprland xdg-desktop-portal gnome-calendare gnome-calculator ponymix htop hyprshot hyprpicker

while :; do
    echo "Delete old .config folder? [y/N]"
    read
	case "$REPLY" in
		[Nn]* | "" ) break;;
		[Yy]* ) 
		echo purging .config folder...
        for i in $(ls ./files/.config/); do
            rm -rf ~/.config/$i
        done
        break;;
    esac
done

echo copying configuration files...
cp -rf ./files/.config/* ~/.config/
cp -rf ./files/.icons/ ~/
cp -rf ./files/.themes/ ~/
cp -rf ./files/.local/ ~/
cp -rf ./files/.zprofile ~/
cp -rf ./files/.zshrc ~/

echo enabling/restarting some things...
pkill waybar; waybar & disown
pkill hyprpaper; hyprpaper & disown
pkill dunst; dunst & disown

echo "hyprland reload: $(hyprctl reload)"

echo All done!

