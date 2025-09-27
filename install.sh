ln -sf "$(pwd)/nvim" ~/.config/nvim
ln -sf "$(pwd)/hypr" ~/.config/hypr
ln -sf "$(pwd)/kitty" ~/.config/kitty
mkdir -p ~/Pictures
ln -sf "$(pwd)/hypr/wallpapers" ~/Pictures/Wallpaper
mkdir -p ~/.local/share/systemd/user
ln -sf "$(pwd)/systemd/kmonad.service" ~/.local/share/systemd/user/kmonad.service
ln -sf "$(pwd)/git" ~/.config/git
ln -sf "$(pwd)/fish" ~/.config/fish
ln -sf "$(pwd)/dunst" ~/.config/dunst
ln -sf "$(pwd)/vifm" ~/.config/vifm
ln -sf "$(pwd)/swaync" ~/.config/swaync
ln -sf "$(pwd)/walker" ~/.config/walker
ln -sf "$(pwd)/fastfetch" ~/.config/fastfetch
