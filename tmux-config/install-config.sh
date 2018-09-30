#!/bin/bash
# Script written by: JM.
# This apply custom configurations on Tmux.

FILE="${HOME}/.tmux.conf"
if [ -e "${FILE}" ]; then
  echo "The '.tmux.config' file already exists, remove the file and try again."
else
  ln -s "$(pwd)/tmux.conf" "${HOME}/.tmux.conf"

  echo 'Installation finished with success!'
fi

