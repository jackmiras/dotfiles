#!/bin/bash
# Script written by: JM.
# This apply custom configurations on Tmux.

if [[ ! -d "${HOME}/.tmux" ]]; then
  mkdir "${HOME}/.tmux"
fi

ln -s "${HOME}/Projects/dotfiles/tmux-config/themes" "${HOME}/.tmux/themes"
ln -s "${HOME}/Projects/dotfiles/tmux-config/tmux.conf" "${HOME}/.tmux.conf"
ln -s "${HOME}/Projects/dotfiles/tmux-config/plugins" "${HOME}/.tmux/plugins"

echo 'Installation finished with success!'
