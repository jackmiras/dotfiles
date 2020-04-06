#!/bin/bash
# Script written by: JM.
# This configure Neovim text editor.

# Creating symbolic links to Neovim.
mkdir -p "$HOME/.config/nvim"
ln -s "${HOME}/Projects/dotfiles/neovim-config/plugged" "$HOME/.config/nvim"
ln -s "${HOME}/Projects/dotfiles/neovim-config/autoload" "$HOME/.config/nvim"
ln -s "${HOME}/Projects/dotfiles/neovim-config/init.vim" "$HOME/.config/nvim"
ln -s "${HOME}/Projects/dotfiles/neovim-config/UltiSnips" "$HOME/.config/nvim"

# Creating symbolic links to Vim.
mkdir -p "$HOME/.vim"
ln -s "${HOME}/Projects/dotfiles/neovim-config/plugged" "$HOME/.vim"
ln -s "${HOME}/Projects/dotfiles/neovim-config/autoload" "$HOME/.vim"
ln -s "${HOME}/Projects/dotfiles/neovim-config/UltiSnips" "$HOME/.vim"
ln -s "${HOME}/Projects/dotfiles/neovim-config/init.vim" "$HOME/.vimrc"

echo 'Installation finished with success!'
