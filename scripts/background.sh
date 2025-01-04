folder=$HOME/.config/hypr/wallpappers
swaybg -i $(find $folder -type f -print0 | shuf -zn1) -m fill &
