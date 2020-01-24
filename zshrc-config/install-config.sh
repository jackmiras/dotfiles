#!/bin/bash
# Script written by: JM.
# This apply custom configurations on Zsh.

FILE="${HOME}/.zshrc"
if [ -e "${FILE}" ]; then
  echo "The '.zshrc' file already exists, remove the file and try again."
else
  # Removing the default files.
  rm -rf "${HOME}/.zshrc"

  # Creating symbolic link of Zsh configs into the home of computer.
  ln -s "$(pwd)/zshrc" "${HOME}/.zshrc"

  # Installing zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM}"/plugins/zsh-autosuggestions

  # Installing zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}"/plugins/zsh-syntax-highlighting

  echo 'Installation finished with success!'
fi
