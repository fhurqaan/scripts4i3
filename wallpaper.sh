#!/bin/bash
#ext="${wpf:(-4)}"
# check is unexpected shutdown and lock file not removed
# then remove lock file.
pgrep sxiv;retval="$?" 
if [[ $retval == "1" ]] && [ -f ~/.local/Sxiv.lock ] ; then
	rm ~/.local/Sxiv.lock
fi
[ -f ~/.local/Sxiv.lock ] && kdialog --error  "Sxiv instance already running..." --title "SXIV error message" && exit
touch ~/.local/Sxiv.lock
case $1 in
    new) sxiv -qtrg 480x320 ~/Pictures/* ;;
    set) feh --bg-center $HOME/.wallpaper.png ;;
esac
rm ~/.local/Sxiv.lock