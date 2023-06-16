#!/bin/bash
# Script written by: JM.
# This configure Neovim text editor.

# Creating plugged dir
mkdir -p "${HOME}/Projects/dotfiles/neovim-config/plugged"

# Creating symbolic links
mkdir -p "$HOME/.config/nvim"
ln -s "${HOME}/Projects/dotfiles/neovim-config/plugged" "$HOME/.config/nvim" || true # Continue if symlink exists
ln -s "${HOME}/Projects/dotfiles/neovim-config/autoload" "$HOME/.config/nvim" || true # Continue if symlink exists
ln -s "${HOME}/Projects/dotfiles/neovim-config/init.vim" "$HOME/.config/nvim" || true # Continue if symlink exists
ln -s "${HOME}/Projects/dotfiles/neovim-config/UltiSnips" "$HOME/.config/nvim" || true # Continue if symlink exists
ln -s "${HOME}/Projects/dotfiles/neovim-config/coc-settings.json" "$HOME/.config/nvim" || true # Continue if symlink exists

echo 'Installation finished with success!'
