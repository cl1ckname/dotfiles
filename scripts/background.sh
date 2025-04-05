folder=$HOME/.config/hypr/wallpapers
swaybg -i $(find $folder -type f -print0 | shuf -zn1) -m fill &
