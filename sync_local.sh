#!/bin/bash
set -e

echo "正在从 dotfiles 同步到本地..."

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 复制配置文件
cp "$SOURCE_DIR/vimrc" ~/.vimrc
cp "$SOURCE_DIR/tmux.conf" ~/.tmux.conf
cp "$SOURCE_DIR/ignore" ~/.ignore
cp "$SOURCE_DIR/ideavimrc" ~/.ideavimrc

# 同步配置目录
rsync -av --delete "$SOURCE_DIR/nvim/" "$HOME/.config/nvim/"
rsync -av --delete "$SOURCE_DIR/yazi/" "$HOME/.config/yazi/"
rsync -av --delete "$SOURCE_DIR/wezterm/" "$HOME/.config/wezterm/"

echo "同步完成"
