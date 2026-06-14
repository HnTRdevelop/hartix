#!/bin/bash

echo "|------------------------------------------------------------------------|"
echo "|        HArch - HnTR hyprland on arch linux installation script         |"
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
	read
	case "$REPLY" in
		[Nn]* | "" ) break;;
		[Yy]* )
		yay -Sy hyprland hyprpaper hypridle hyprlock hyprlock kitty nautilus polkit-gnome copyq firefox waybar dunst gpu-screen-recorder-ui qpwgraph v2rayn easyeffects lsp-plugins-standalone lsp-plugins-lv2 ttf-hack-nerd ttf-terminus-nerd ttf-profont-nerd rofi gnome-calculator pavucontrol gedit emote zsh zsh-autocomplete zsh-syntax-highlighting pipewire wireplumber pipewire-pulse xdg-desktop-portal-hyprland xdg-desktop-portal gnome-calendar gnome-calculator ponymix htop hyprshot hyprpicker
		break;;
	esac
done

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

while :; do
	echo "Restart services? [Y/n]"
	read
	case "$REPLY" in
		[Yy]* | "" )
			echo enabling/restarting some things...
			systemctl --user restart waybar
			systemctl --user restart hyprpaper
			systemctl --user restart dunts
			echo "hyprland reload: $(hyprctl reload)"
			break;;
		[Nn]* ) break;;
	esac
done

echo All done!

