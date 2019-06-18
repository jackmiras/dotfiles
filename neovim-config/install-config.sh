#!/bin/bash
# Script written by: JM.
# This configure Neovim text editor.

NEOVIM="$HOME/.config/nvim/"
VIM="$HOME/.vim/"
if [[ -d "$NEOVIM" &&  -d "$VIM" ]]; then
  echo "The '.nvim' and '.vim' directory already exists, remove this directory or check it "\
       "out github page and install the plugins and color scheme individually."
else
  # Creating symbolic links to Neovim.
  mkdir -p "$HOME/.config/nvim"
  ln -s "$(pwd)/autoload" "$HOME/.config/nvim"
  ln -s "$(pwd)/plugged" "$HOME/.config/nvim"
  ln -s "$(pwd)/indent" "$HOME/.config/nvim"
  ln -s "$(pwd)/UltiSnips" "$HOME/.config/nvim"
  ln -s "$(pwd)/init.vim" "$HOME/.config/nvim"
  ln -s "$(pwd)/colors" "$HOME/.config/nvim"

  # Creating symbolic links to Vim.
  mkdir -p "$HOME/.vim"
  ln -s "$(pwd)/autoload" "$HOME/.vim"
  ln -s "$(pwd)/plugged" "$HOME/.vim"
  ln -s "$(pwd)/indent" "$HOME/.vim"
  ln -s "$(pwd)/UltiSnips" "$HOME/.vim"
  ln -s "$(pwd)/colors" "$HOME/.vim"
  ln -s "$(pwd)/init.vim" "$HOME/.vimrc"

	echo 'Installation finished with success!'
fi
