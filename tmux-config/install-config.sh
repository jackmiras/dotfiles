#!/bin/bash
# Script written by: JM.
# This apply custom configurations on Tmux.

FILE="${HOME}/.tmux.conf"
if [ -e "${FILE}" ]; then
  echo "The '.tmux.config' file already exists, remove the file and try again."
else
  if [[ ! -d "${HOME}/.tmux" ]]; then
    mkdir "${HOME}/.tmux"
  fi

  ln -s "$(pwd)/tmux.conf" "${HOME}/.tmux.conf"
  ln -s "$(pwd)/themes" "${HOME}/.tmux/themes"
  ln -s "$(pwd)/plugins" "${HOME}/.tmux/plugins"
  ln -s "$(pwd)/resurrect" "${HOME}/.tmux/resurrect"

  echo 'Installation finished with success!'
fi
