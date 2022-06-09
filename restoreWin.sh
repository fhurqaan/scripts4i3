#!/bin/bash
# My worksapce names
# first elenment is null becaue bash starts from elenment 0
# json filename 1.json for workspace 1, 2.json for workspace 2, etc.... 
#
ws=(""  ":Main" ":Web" ":C0de" "MT" ":VLC" ":LibreOffice" ":Inkscape" ":Gimp" "MT" "MT")

# Path to where my .json files saved
layoutPath="$HOME/.config/i3/layouts/"

# check if json file exists, then load saved workspace
for i in ${!ws[@]}; do
	wsname=$i${ws[$i]}
	if  [[ -f "$layoutPath$i.json" ]] 
	then
		echo Loading layout for $wsname 
		i3-msg "workspace $wsname; append_layout $layoutPath/$i.json"
	fi
done

# execute the list of programs to be loaded 
# in the layout with the &, 1 per line
# regardless of workspace

urxvt &
thunar &
# atom &
firefox &
# vlc &
#ftp &
