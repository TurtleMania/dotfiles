cd ~/wallpapers
selected=$(fzf)

nohup ~/.config/hypr/scripts/change-wallpaper.sh $selected &> /dev/null
