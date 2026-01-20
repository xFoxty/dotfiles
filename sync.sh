#!/bin/bash
echo "正在备份配置文件"
TARGET_DIR=$(pwd)

mkdir -p "$TARGET_DIR/nvim"
mkdir -p "$TARGET_DIR/yazi"
mkdir -p "$TARGET_DIR/wezterm"

cp ~/.vimrc ~/dotfiles/
cp ~/.tumx.config ~/dotfiles/
rsync -av --delete --exclude="lazy-lock.json" "$HOME/.config/nvim/" "$TARGET_DIR/nvim/"
rsync -av --delete "$HOME/.config/yazi/" "$TARGET_DIR/yazi/"
rsync -av --delete "$HOME/.config/wezterm/" "$TARGET_DIR/wezterm"
git add .
git commit -m "Update configs: $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main
echo "搞定🆗"
