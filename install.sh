#!/bin/bash

figlet 'Template' | lolcat
echo "Make with love by Zaw Wanz #crd to Dr.404"
main_script="template.sh"

location="/opt/"
destination_dir="/usr/bin/"
if [ "$(whoami)" != "root" ]; then
    echo "Warning: This installation requires root privileges. Please run this script with sudo."
    exit 1
fi

cp "$main_script" "$location"


ln -s "${location}${main_script}" "${destination_dir}template"
chmod +x "${location}${main_script}"
chmod +x "${destination_dir}template"
echo "Installation complete. You can now run 'template' from anywhere."


