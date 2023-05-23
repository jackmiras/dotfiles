#!/bin/bash
# Script written by: JM.
# This apply custom configurations on Bash.

rm -rf "${HOME}/.bash_profile"
ln -s "${HOME}/Projects/dotfiles/bash-config/bash_profile" "${HOME}/.bash_profile" || true # Continue if symlink exists
ln -s "${HOME}/Projects/dotfiles/bash-config/starship.toml" "${HOME}/.config/starship.toml" || true # Continue if symlink exists

echo 'Installation finished with success!'
