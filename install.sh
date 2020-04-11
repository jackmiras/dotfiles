#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source "./asdf/os-basics.sh"
source "./asdf/asdf-install.sh"

function install_zsh() {
  sudo apt-get install -y zsh
}

function install_ccat() {
  source "${HOME}/.asdf/asdf.sh"
  go get -u github.com/jingweno/ccat
}

function install_tmux() {
  sudo apt-get install -y tmux
}

function install_ctags() {
  sudo apt-get install -y ctags
}

# function install_docker() {
#   # Install Docker
#   # Install Docker-compose
# }

function install_tflint() {
  readonly URL="https://api.github.com/repos/terraform-linters/tflint/releases/latest"
  curl -L "$(curl -Ls "${URL}" | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip
  unzip tflint.zip && rm tflint.zip
  mv tflint "$HOME/.local/bin/"
}

function install_neovim() {
  source "${HOME}/.asdf/asdf.sh"
  sudo apt-get install -y neovim

  gem install neovim
  pip install pynvim
  pip3 install pynvim
  yarn global add neovim
}

function install_kubectl() {
  readonly KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release"
  curl -LO "${KUBECTL_URL}/$(curl -s ${KUBECTL_URL}/stable.txt)/bin/linux/amd64/kubectl"
  sudo chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
}

function install_linters() {
  sudo apt-get install -y shellcheck
  sudo apt-get install -y yamllint
}

function git_global_configs() {
  git config --global page.branch false
}

function install_dotfiles() {
  mkdir "${HOME}/Projects" && cd "${HOME}/Projects"
  git clone https://github.com/jackmiras/dotfiles.git && cd dotfiles

  install_dotfiles_tmux
  install_dotfile_neovim
  install_dotfiles_ohmyzsh
}

function install_dotfiles_tmux() {
  bash -c "${HOME}/Projects/dotfiles/tmux-config/install-config.sh"
}

function install_dotfile_neovim() {
  cd "${HOME}/Projects/dotfiles/neovim-config"
  ./install-config.sh

  mv init.vim init-backup.vim
  echo "source $HOME/Projects/dotfiles/neovim-config/configs/plugins.vimrc" >> init.vim

  mkdir plugged && nvim -c "PlugInstall" -c "q" -c "q"
  rm -rf init.vim && mv init-backup.vim init.vim
}

function install_dotfiles_ohmyzsh() {
  readonly base_url="https://raw.githubusercontent.com"
  curl -fsSL ${base_url}/ohmyzsh/ohmyzsh/master/tools/install.sh -o ohmyzsh.sh

  # Make oh-my-zsh change default shell to ZSH
  sed -i "s/read opt/readonly opt=y/g" ohmyzsh.sh

  # Making oh-my-zsh keep .zshrc file
  readonly ZSHRC_CONFIG_DIR="cd \"\${HOME}\/Projects\/dotfiles\/zshrc\-config\""
  readonly INSTALL_CONFIG_SH=".\/install-config.sh"
  readonly HOME_DIR="cd \"\${HOME}\""
  readonly EXEC_ZSH="exec zsh -l"

  readonly REPLACEMENT="${ZSHRC_CONFIG_DIR}\\
  ${INSTALL_CONFIG_SH}\\
  ${HOME_DIR}\\
  ${EXEC_ZSH}"

  sed -i "s/exec zsh -l/${REPLACEMENT}/g" ohmyzsh.sh

  # Intalling oh-my-zsh
  sudo chmod +x ohmyzsh.sh
  sh -c "./ohmyzsh.sh"
  rm -rf ohmyzsh.sh
}

function main() {
  homebrew
  clean_os
  update_os
  install_os_dependencies

  install_asdf
  install_php
  # install_java
  install_ruby
  install_golang
  install_nodejs
  install_python
  # install_haskell

  install_zsh
  install_ccat
  install_tmux
  install_ctags
  install_docker
  install_tflint
  install_neovim
  install_kubectl
  git_global_configs

  # This have to be the last function call
  install_dotfiles
}

main
