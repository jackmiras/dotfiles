#!/bin/bash
# Script written by: JM.
# This apply custom configurations on Zsh.

rm -rf "${HOME}/.zshrc"
ln -s "${HOME}/Projects/dotfiles/zshrc-config/zshrc" "${HOME}/.zshrc"
ln -s "${HOME}/Projects/dotfiles/zshrc-config/starship.toml" "${HOME}/.config/"

readonly BASE_URL="https://github.com/zsh-users"
git clone "${BASE_URL}/zsh-autosuggestions.git" "${HOME}/.oh-my-zsh/plugins/zsh-autosuggestions"
git clone "${BASE_URL}/zsh-syntax-highlighting.git" "${HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting"

echo 'Installation finished with success!'
