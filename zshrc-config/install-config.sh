#!/bin/bash
# Script written by: JM.
# This apply custom configurations on Zsh.

FILE="${HOME}/.zshrc"
if [ -e "${FILE}" ]; then
  echo "The '.zshrc' file already exists, remove the file and try again."
else
  # Updating Space-ship theme.
  git submodule update --init

  # Removing the default files.
  rm -rf "${HOME}/.zshrc"
  rm -rf "${HOME}/.oh-my-zsh/themes"
  rm -rf "${HOME}/.oh-my-zsh/custom"

  # Creating symbolic link of Zsh configs into the home of computer.
  ln -s "${HOME}/Projects/zshrc-config/zshrc" "${HOME}/.zshrc"
  ln -s "${HOME}/Projects/zshrc-config/themes" "${HOME}/.oh-my-zsh/"
  ln -s "${HOME}/Projects/zshrc-config/custom" "${HOME}/.oh-my-zsh/"

  echo 'Installation finished with success!'
fi
