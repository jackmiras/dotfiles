#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source "./asdf/os-basics.sh"
source "./asdf/asdf-install.sh"

function install_snaps() {
  echo "#######################################################################"
  echo "# Install snaps                                                       #"
  echo "#######################################################################"

  if [[ "$(uname -s)" == "Linux" ]]; then
    sudo apt-get update -y
    sudo apt-get install -y snapd

    sudo snap install vlc
    sudo snap install gimp
    sudo snap install htop
    sudo snap install drawio
    sudo snap install discord
    sudo snap install postman
    sudo snap install keepassxc
    sudo snap install simplenote
    sudo snap install code --classic
    sudo snap install helm --classic
    sudo snap install slack --classic
    sudo snap install sublime-text --classic
  fi
}

function install_ag() {
  echo "#######################################################################"
  echo "# Installing The Silver Searcher                                      #"
  echo "#######################################################################"

  brew install the_silver_searcher
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

  brew install entr
}

function install_tmux() {
  echo "#######################################################################"
  echo "# Installing tmux                                                     #"
  echo "#######################################################################"

  brew install tmux
}

function install_ctags() {
  echo "#######################################################################"
  echo "# Installing ctags                                                    #"
  echo "#######################################################################"

  brew tap universal-ctags/universal-ctags
  brew install --HEAD universal-ctags
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
  pip3 install psycopg
  pip3 install psycopg-binary
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

  if [[ "$(uname -s)" == "Linux" ]]; then
    readonly DOCKER_COMPOSE_RELEASE="2.18.1"

    sudo apt-get remove runc || true # Continue if package is not present
    sudo apt-get remove docker || true # Continue if package is not present
    sudo apt-get remove docker.io || true # Continue if package is not present
    sudo apt-get remove containerd || true # Continue if package is not present
    sudo apt-get remove docker-engine || true # Continue if package is not present

    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    sudo usermod -aG docker "${USER}"
  elif [[ "$(uname -s)" == "Darwin" ]]; then
    brew install --cask docker
  fi
}

function install_terraform() {
  echo "#######################################################################"
  echo "# Installing Terraform                                                #"
  echo "#######################################################################"

  brew tap hashicorp/tap
  brew install hashicorp/tap/terraform
}

function install_neovim() {
  echo "#######################################################################"
  echo "# Installing neovim                                                   #"
  echo "#######################################################################"

  source "${HOME}/.asdf/asdf.sh"
  brew install neovim

  gem install neovim
  pip3 install pynvim
  yarn global add neovim
}

function install_kubectl() {
  echo "#######################################################################"
  echo "# Installing kubctl                                                   #"
  echo "#######################################################################"

  brew install kubectl
}

function install_aws_cli() {
  echo "#######################################################################"
  echo "# Installing AWS CLI                                                  #"
  echo "#######################################################################"

  if [[ "$(uname -s)" == "Linux" ]]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip && sudo ./aws/install --update
    rm -rf awscliv2.zip && rm -rf aws
  elif [[ "$(uname -s)" == "Darwin" ]]; then
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg ./AWSCLIV2.pkg -target /
  fi
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

  brew install tflint

  echo "#######################################################################"
  echo "# Installing Shellscript linters                                      #"
  echo "#######################################################################"

  brew install shellcheck

  echo "#######################################################################"
  echo "# Installing YAML linters                                             #"
  echo "#######################################################################"

  brew install yamllint

  echo "#######################################################################"
  echo "# Installing SQL linters                                              #"
  echo "#######################################################################"

  pip3 install sqlfluff
  sudo ln -s "${HOME}/.asdf/installs/python/3.*/bin/sqlfluff" /usr/bin || true # Continue if symlink exists
}

function git_global_configs() {
  echo "#######################################################################"
  echo "# Configure Git globals                                               #"
  echo "#######################################################################"

  git config --global page.branch false
  git config --global alias.glog "log --all --decorate --oneline --graph"
}

function install_starship() {
  echo "#######################################################################"
  echo "# Installing Starship Cross-Shell Prompt                              #"
  echo "#######################################################################"

  brew install starship
}

function install_lsp_language_servers() {
  echo "#######################################################################"
  echo "# Installing LSP language servers                                     #"
  echo "#######################################################################"

  yarn global add intelephense
  yarn global add dockerfile-language-server-nodejs

  brew install hashicorp/tap/terraform-ls

  go install golang.org/x/tools/gopls@latest
}

function install_dotfiles() {
  echo "#######################################################################"
  echo "# Installing dotfiles                                                 #"
  echo "#######################################################################"

  mkdir -p "${HOME}/Projects" && cd "${HOME}/Projects"
  git clone https://github.com/jackmiras/dotfiles.git && cd dotfiles

  install_dotfiles_tmux
  install_dotfiles_neovim
  install_dotfiles_bash
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
  nvim --headless -c "CocInstall coc-json" -c "qall"
  nvim --headless -c "CocInstall coc-phpls" -c "qall"
  rm -rf init.vim && mv init-backup.vim init.vim
}

function install_dotfiles_bash() {
  echo "#######################################################################"
  echo "# Install dotfiles bash                                               #"
  echo "#######################################################################"

  bash -c "${HOME}/Projects/dotfiles/bash-config/install-config.sh"
}

function main() {
  homebrew
  clean_os
  update_os
  install_os_dependencies

  install_asdf
  install_php
  install_lua
  install_java
  install_ruby
  install_golang
  install_nodejs
  install_python

  install_snaps

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
  git_global_configs
  install_starship
  install_lsp_language_servers

  # This have to be the last function call
  install_dotfiles
}

main
