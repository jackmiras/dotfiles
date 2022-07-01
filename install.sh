#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source "./asdf/os-basics.sh"
source "./asdf/asdf-install.sh"

function install_ag() {
  echo "#######################################################################"
  echo "# Installing The Silver Searcher                                      #"
  echo "#######################################################################"

  sudo apt-get install silversearcher-ag
}

function install_zsh() {
  echo "#######################################################################"
  echo "# Installing ZSH                                                      #"
  echo "#######################################################################"

  sudo apt-get install -y zsh
}

function install_ccat() {
  echo "#######################################################################"
  echo "# Installing ccat                                                     #"
  echo "#######################################################################"

  source "${HOME}/.asdf/asdf.sh"
  go get -u github.com/jingweno/ccat
  asdf reshim
}

function install_entr() {
  echo "#######################################################################"
  echo "# Installing entr                                                     #"
  echo "#######################################################################"

  sudo apt-get install -y entr
}

function install_tmux() {
  echo "#######################################################################"
  echo "# Installing tmux                                                     #"
  echo "#######################################################################"

  sudo apt-get install -y tmux
}

function install_ctags() {
  echo "#######################################################################"
  echo "# Installing ctags                                                    #"
  echo "#######################################################################"

  sudo apt-get install -y ctags
}

function install_mycli() {
  echo "#######################################################################"
  echo "# Installing mycli - MySQL CLI                                        #"
  echo "#######################################################################"

  pip3 install mycli
}

function install_pgcli() {
  echo "#######################################################################"
  echo "# Installing pgcli - Postgre CLI                                      #"
  echo "#######################################################################"

  pip3 install pgcli
  sudo ln -s "${HOME}/.asdf/installs/python/3.*/bin/pgcli" /usr/bin
}

function install_litecli() {
  echo "#######################################################################"
  echo "# Installing litecli - SQLite CLI                                     #"
  echo "#######################################################################"

  pip3 install litecli
  sudo ln -s "${HOME}/.asdf/installs/python/3.*/bin/litecli" /usr/bin
}

function install_sqlfluff() {
  echo "#######################################################################"
  echo "# Installing litecli - SQLite CLI                                     #"
  echo "#######################################################################"

  pip3 install sqlfluff
  sudo ln -s "${HOME}/.asdf/installs/python/3.*/bin/sqlfluff" /usr/bin
}

function install_docker() {
  echo "#######################################################################"
  echo "# Installing Docker                                                   #"
  echo "#######################################################################"

  readonly UBUNTU_RELEASE="focal"
  readonly DOCKER_COMPOSE_RELEASE="1.29.2"
  readonly DOCKER_MACHINE_VERSION="0.16.0"

  sudo apt-get remove runc || true # Continue if package is not present
  sudo apt-get remove docker || true # Continue if package is not present
  sudo apt-get remove docker.io || true # Continue if package is not present
  sudo apt-get remove containerd || true # Continue if package is not present
  sudo apt-get remove docker-engine || true # Continue if package is not present

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88

  sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${UBUNTU_RELEASE} stable"

  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io

  sudo usermod -aG docker "${USER}"

  echo "#######################################################################"
  echo "# Installing docker-compose                                           #"
  echo "#######################################################################"

  sudo curl \
    -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_RELEASE}/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose

  sudo chmod +x /usr/local/bin/docker-compose

  echo "#######################################################################"
  echo "# Installing docker-machine                                           #"
  echo "#######################################################################"

  readonly BASE="https://github.com/docker/machine/releases/download/v${DOCKER_MACHINE_VERSION}" &&
  curl -L "${BASE}/docker-machine-$(uname -s)-$(uname -m)" >/tmp/docker-machine &&
  sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine
}

function install_terraform() {
  echo "#######################################################################"
  echo "# Installing Terraform                                                #"
  echo "#######################################################################"

  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  sudo apt install terraform
}

function install_neovim() {
  echo "#######################################################################"
  echo "# Installing neovim                                                   #"
  echo "#######################################################################"

  source "${HOME}/.asdf/asdf.sh"
  sudo apt-get install -y neovim

  gem install neovim
  pip3 install pynvim
  yarn global add neovim
}

function install_kubectl() {
  echo "#######################################################################"
  echo "# Installing kubctl                                                   #"
  echo "#######################################################################"

  readonly KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release"
  curl -LO "${KUBECTL_URL}/$(curl -s ${KUBECTL_URL}/stable.txt)/bin/linux/amd64/kubectl"
  sudo chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl
}

function install_aws_cli() {
  echo "#######################################################################"
  echo "# Installing AWS CLI                                                  #"
  echo "#######################################################################"

  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip && sudo ./aws/install --update
  rm -rf awscliv2.zip && rm -rf aws
}

function install_linters() {
  echo "#######################################################################"
  echo "# Installing Python linters                                           #"
  echo "#######################################################################"

  mkdir -p "${HOME}/.local/bin/"
  readonly PYTHON_VERSION=$(python3 --version | awk '{print $2}')
  readonly PYTHON_BIN="${HOME}/.asdf/installs/python/${PYTHON_VERSION}/bin"

  pip3 install black
  ln -s "${PYTHON_BIN}/black" "${HOME}/.local/bin" || true # Continue if symlink exists

  pip3 install isort
  ln -s "${PYTHON_BIN}/isort" "${HOME}/.local/bin" || true # Continue if symlink exists

  pip3 install bandit
  ln -s "${PYTHON_BIN}/bandit" "${HOME}/.local/bin" || true # Continue if symlink exists

  pip3 install flake8
  ln -s "${PYTHON_BIN}/flake8" "${HOME}/.local/bin" || true # Continue if symlink exists

  echo "#######################################################################"
  echo "# Installing Terraform linters                                        #"
  echo "#######################################################################"

  readonly URL="https://api.github.com/repos/terraform-linters/tflint/releases/latest"
  curl -L "$(curl -Ls "${URL}" | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip
  unzip tflint.zip && rm tflint.zip && mv tflint "${HOME}/.local/bin/"

  echo "#######################################################################"
  echo "# Installing Shellscript linters                                      #"
  echo "#######################################################################"

  sudo apt-get install -y shellcheck

  echo "#######################################################################"
  echo "# Installing YAML linters                                             #"
  echo "#######################################################################"

  sudo apt-get install -y yamllint
}

function install_azure_cli(){
  echo "#######################################################################"
  echo "# Installing Azure CLI                                                #"
  echo "#######################################################################"

  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
}

function install_languagetool() {
  echo "#######################################################################"
  echo "# Installing LanguageTool                                             #"
  echo "#######################################################################"

  wget https://languagetool.org/download/LanguageTool-stable.zip

  unzip LanguageTool-stable.zip && rm -rf LanguageTool-stable.zip

  mv LanguageTool* languagetool && mv languagetool "${HOME}/.languagetool"

  rm -rf LanguageTool*
}

function git_global_configs() {
  echo "#######################################################################"
  echo "# Configure Git globals                                               #"
  echo "#######################################################################"

  git config --global page.branch false
  git config --global alias.glog "log --all --decorate --oneline --graph"
}

function install_dotfiles() {
  echo "#######################################################################"
  echo "# Installing dotfiles                                                 #"
  echo "#######################################################################"

  mkdir "${HOME}/Projects" && cd "${HOME}/Projects"
  git clone https://github.com/jackmiras/dotfiles.git && cd dotfiles

  install_dotfiles_tmux
  install_dotfile_neovim
  install_dotfiles_ohmyzsh
}

function install_dotfiles_tmux() {
  echo "#######################################################################"
  echo "# Install dotfiles tmux                                               #"
  echo "#######################################################################"

  bash -c "${HOME}/Projects/dotfiles/tmux-config/install-config.sh"
}

function install_dotfile_neovim() {
  echo "#######################################################################"
  echo "# Install dotfiles neovim                                             #"
  echo "#######################################################################"

  cd "${HOME}/Projects/dotfiles/neovim-config"
  ./install-config.sh

  mv init.vim init-backup.vim
  echo "source $HOME/Projects/dotfiles/neovim-config/configs/plugins.vimrc" >> init.vim

  mkdir plugged
  nvim --headless -c "PlugInstall" -c "qall"
  nvim --headless -c "TSInstall go" -c "qall"
  nvim --headless -c "TSInstall css" -c "qall"
  nvim --headless -c "TSInstall php" -c "qall"
  nvim --headless -c "TSInstall vue" -c "qall"
  nvim --headless -c "TSInstall yaml" -c "qall"
  nvim --headless -c "TSInstall elixir" -c "qall"
  nvim --headless -c "TSInstall python" -c "qall"
  nvim --headless -c "TSInstall markdown" -c "qall"
  nvim --headless -c "TSInstall dockerfile" -c "qall"
  nvim --headless -c "TSInstall javascript" -c "qall"
  rm -rf init.vim && mv init-backup.vim init.vim
}

function install_dotfiles_ohmyzsh() {
  echo "#######################################################################"
  echo "# Install dotfiles ohmyzsh                                            #"
  echo "#######################################################################"

  readonly base_url="https://raw.githubusercontent.com"
  curl -fsSL ${base_url}/ohmyzsh/ohmyzsh/master/tools/install.sh -o ohmyzsh.sh

  # Make oh-my-zsh change default shell to ZSH
  sed -i "s/read -r opt/readonly opt=Y/g" ohmyzsh.sh

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

function install_snaps() {
  echo "#######################################################################"
  echo "# Install snaps                                                       #"
  echo "#######################################################################"

  sudo apt-get update -y
  sudo apt-get install -y snapd

  sudo snap install vlc
  sudo snap install gimp
  sudo snap install htop
  sudo snap install drawio
  sudo snap install discord
  sudo snap install postman
  sudo snap install spotify
  sudo snap install postbird
  sudo snap install keepassxc
  sudo snap install simplenote
  sudo snap install code --classic
  sudo snap install helm --classic
  sudo snap install slack --classic
  sudo snap install telegram-desktop
  sudo snap install sublime-text --classic
}

function main() {
  clean_os
  update_os
  install_os_dependencies

  install_asdf
  install_php
  install_java
  install_ruby
  install_golang
  install_nodejs
  install_python
  install_haskell

  install_ag
  install_zsh
  install_ccat
  install_entr
  install_tmux
  install_ctags
  install_mycli
  install_pgcli
  install_litecli
  install_sqlfluff
  install_docker
  install_terraform
  install_neovim
  install_aws_cli
  install_kubectl
  install_linters
  install_azure_cli
  install_languagetool
  git_global_configs

  install_snaps

  # This have to be the last function call
  install_dotfiles
}

main
