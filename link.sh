#!/usr/bin/env bash


set -euo pipefail

# Ensure XDG config dir
mkdir -p ~/.config

# Create or update a symlink to the dotfiles directory.
# - If a symlink exists: remove it and recreate (ensures correct target)
# - If a real file/directory exists: back it up with .backup suffix
# - If nothing exists: create the symlink
safe_link() {
	src="$1"
	dest="$2"
	
	if [ -L "$dest" ]; then
		# It's a symlink - remove and recreate to ensure correct target
		rm "$dest"
		ln -s "$src" "$dest"
		echo "Relinked: $dest -> $src"
	elif [ -e "$dest" ]; then
		# It's a real file/directory - back it up first
		backup="${dest}.backup"
		mv "$dest" "$backup"
		ln -s "$src" "$dest"
		echo "Backed up $dest to $backup and linked to $src"
	else
		# Doesn't exist - create symlink
		ln -s "$src" "$dest"
		echo "Linked: $dest -> $src"
	fi
}

# Link config directories/files
safe_link "$PWD/sway"      "$HOME/.config/sway"
safe_link "$PWD/waybar"   "$HOME/.config/waybar"
safe_link "$PWD/swaylock" "$HOME/.config/swaylock"
safe_link "$PWD/foot"     "$HOME/.config/foot"
safe_link "$PWD/mako"     "$HOME/.config/mako"
safe_link "$PWD/kanshi"    "$HOME/.config/kanshi"
safe_link "$PWD/nvim"     "$HOME/.config/nvim"
safe_link "$PWD/rofi"     "$HOME/.config/rofi"
safe_link "$PWD/xdg-desktop-portal" "$HOME/.config/xdg-desktop-portal"
safe_link "$PWD/vscode-custom.css" "$HOME/.config/vscode-custom.css"

# zshrc is a single file in the repo
safe_link "$PWD/zsh/.zshrc" "$HOME/.zshrc"

