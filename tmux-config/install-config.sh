#!/bin/bash
# Script written by: JM.
# This apply custom configurations on Tmux.

if [[ ! -d "${HOME}/.tmux" ]]; then
  mkdir "${HOME}/.tmux"
fi

ln -s "${HOME}/Projects/dotfiles/tmux-config/themes" "${HOME}/.tmux/themes" || true # Continue if symlink exists
ln -s "${HOME}/Projects/dotfiles/tmux-config/tmux.conf" "${HOME}/.tmux.conf" || true # Continue if symlink exists
ln -s "${HOME}/Projects/dotfiles/tmux-config/plugins" "${HOME}/.tmux" || true # Continue if symlink exists

echo "TMUX configuration was successfully installed!"
