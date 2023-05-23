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

function install_ccat() {
  echo "#######################################################################"
  echo "# Installing ccat                                                     #"
  echo "#######################################################################"

  source "${HOME}/.asdf/asdf.sh"
  go install github.com/jingweno/ccat@latest
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

  sudo apt-get install -y universal-ctags
}

function install_mycli() {
  echo "#######################################################################"
  echo "# Installing mycli - MySQL CLI                                        #"
  echo "#######################################################################"

  pip3 install mycli
  sudo ln -s "${HOME}/.asdf/installs/python/3.*/bin/mycli" /usr/bin || true # Continue if symlink exists
}

function install_pgcli() {
  echo "#######################################################################"
  echo "# Installing pgcli - Postgre CLI                                      #"
  echo "#######################################################################"

  pip3 install pgcli
  sudo ln -s "${HOME}/.asdf/installs/python/3.*/bin/pgcli" /usr/bin || true # Continue if symlink exists
}

function install_litecli() {
  echo "#######################################################################"
  echo "# Installing litecli - SQLite CLI                                     #"
  echo "#######################################################################"

  pip3 install litecli
  sudo ln -s "${HOME}/.asdf/installs/python/3.*/bin/litecli" /usr/bin || true # Continue if symlink exists
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

  wget -O- https://apt.releases.hashicorp.com/gpg | \
      gpg --dearmor | \
      sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

  gpg --no-default-keyring \
      --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
      --fingerprint

  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
      https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
      sudo tee /etc/apt/sources.list.d/hashicorp.list

  sudo apt update && sudo apt-get install terraform
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

  echo "#######################################################################"
  echo "# Installing SQL linters                                              #"
  echo "#######################################################################"

  pip3 install sqlfluff
  sudo ln -s "${HOME}/.asdf/installs/python/3.*/bin/sqlfluff" /usr/bin || true # Continue if symlink exists
}

function install_azure_cli(){
  echo "#######################################################################"
  echo "# Installing Azure CLI                                                #"
  echo "#######################################################################"

  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
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
  install_dotfiles_neovim
  # install_dotfiles_bash
}

function install_dotfiles_tmux() {
  echo "#######################################################################"
  echo "# Install dotfiles tmux                                               #"
  echo "#######################################################################"

  bash -c "${HOME}/Projects/dotfiles/tmux-config/install-config.sh"
}

function install_dotfiles_neovim() {
  echo "#######################################################################"
  echo "# Install dotfiles neovim                                             #"
  echo "#######################################################################"

  cd "${HOME}/Projects/dotfiles/neovim-config"
  ./install-config.sh

  mv init.vim init-backup.vim
  echo "source $HOME/Projects/dotfiles/neovim-config/configs/plugins.vimrc" >> init.vim

  mkdir -p plugged
  nvim --headless -c "PlugInstall" -c "qall"
  nvim --headless -c "TSInstall go" -c "qall"
  nvim --headless -c "TSInstall css" -c "qall"
  nvim --headless -c "TSInstall lua" -c "qall"
  nvim --headless -c "TSInstall php" -c "qall"
  nvim --headless -c "TSInstall sql" -c "qall"
  nvim --headless -c "TSInstall vim" -c "qall"
  nvim --headless -c "TSInstall vue" -c "qall"
  nvim --headless -c "TSInstall bash" -c "qall"
  nvim --headless -c "TSInstall json" -c "qall"
  nvim --headless -c "TSInstall ruby" -c "qall"
  nvim --headless -c "TSInstall yaml" -c "qall"
  nvim --headless -c "TSInstall elixir" -c "qall"
  nvim --headless -c "TSInstall phpdoc" -c "qall"
  nvim --headless -c "TSInstall python" -c "qall"
  nvim --headless -c "TSInstall markdown" -c "qall"
  nvim --headless -c "TSInstall dockerfile" -c "qall"
  nvim --headless -c "TSInstall javascript" -c "qall"
  rm -rf init.vim && mv init-backup.vim init.vim
}

function install_dotfiles_bash() {
  echo "#######################################################################"
  echo "# Install dotfiles bash                                               #"
  echo "#######################################################################"

  bash -c "${HOME}/Projects/dotfiles/bash-config/install-config.sh"
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
  sudo snap install starship
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

  install_ag
  install_ccat
  install_entr
  install_tmux
  install_ctags
  install_mycli
  install_pgcli
  install_litecli
  install_docker
  install_terraform
  install_neovim
  install_aws_cli
  install_kubectl
  install_linters
  install_azure_cli
  git_global_configs

  install_snaps

  # This have to be the last function call
  install_dotfiles
}

main
