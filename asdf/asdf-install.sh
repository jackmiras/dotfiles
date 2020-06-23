#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function install_asdf() {
  echo "#######################################################################"
  echo "# Installing asdf                                                     #"
  echo "#######################################################################"

  if [[ ! $(command -v asdf) > /dev/null ]]; then

    git clone https://github.com/asdf-vm/asdf.git "${HOME}/.asdf"
    cd "${HOME}/.asdf" && git checkout "$(git describe --abbrev=0 --tags)"

    source "${HOME}/.asdf/asdf.sh"
    source "${HOME}/.asdf/completions/asdf.bash"

    asdf_plugins
    asdf_tool_versions
  fi
}

function asdf_plugins() {
    asdf plugin add php
    asdf plugin add java
    asdf plugin add ruby
    asdf plugin add yarn
    asdf plugin add golang
    asdf plugin add nodejs
    asdf plugin add python
    asdf plugin add haskell
}

function asdf_tool_versions() {
  {
    echo "pip 2.7"
    echo "pip3 3.8"
    echo "php 7.4.7"
    echo "ruby 2.7.0"
    echo "yarn 1.22.4"
    echo "golang 1.14.4"
    echo "haskell 8.10.1"
    echo "nodejs 12.18.1"
    echo "python 3.8.3 2.7.17"
    echo "java adopt-openjdk-12+33"
  } >> "${HOME}/.tool-versions"
}

function install_php() {
  echo "#######################################################################"
  echo "# Installing PHP                                                      #"
  echo "#######################################################################"

  if [[ ! $(command -v php) > /dev/null ]]; then
    asdf install php 7.4.4
  fi
}

function install_java() {
  echo "#######################################################################"
  echo "# Installing Java                                                     #"
  echo "#######################################################################"

  if [[ ! $(command -v java) > /dev/null ]]; then
    sudo mkdir -p /tmp/asdf-java.cache/
    asdf install java adopt-openjdk-12+33
  fi
}

function install_ruby() {
  echo "#######################################################################"
  echo "# Installing Ruby                                                     #"
  echo "#######################################################################"

  if [[ ! $(command -v ruby) > /dev/null ]]; then
    asdf install ruby 2.7.0
  fi
}

function install_golang() {
  echo "#######################################################################"
  echo "# Installing Go                                                       #"
  echo "#######################################################################"

  if [[ ! $(command -v go) > /dev/null ]]; then
    asdf install golang 1.14.1
  fi
}

function install_nodejs() {
  echo "#######################################################################"
  echo "# Installing NodeJs                                                   #"
  echo "#######################################################################"

  if [[ ! $(command -v node) > /dev/null ]]; then
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    asdf install nodejs 12.16.1
    asdf install yarn 1.22.4
  fi
}

function install_python3() {
  echo "#######################################################################"
  echo "# Installing Python3                                                  #"
  echo "#######################################################################"

  if [[ ! $(command -v python3) > /dev/null ]]; then
    asdf install python 3.8.3
  fi
}

function install_python2() {
  echo "#######################################################################"
  echo "# Installing Python2                                                  #"
  echo "#######################################################################"

  if [[ ! $(command -v python2) > /dev/null ]]; then
    asdf install python 2.7.17
  fi
}

function install_python() {
  install_python2
  install_python3

  asdf global python 2.7.17 3.8.3

  pip install --upgrade pip
  pip3 install --upgrade pip

  rm -rf "${HOME}/.asdf/shims/python"
  ln -s "${HOME}/.asdf/shims/python2" "${HOME}/.asdf/shims/python"
}

function install_haskell() {
  echo "#######################################################################"
  echo "# Installing Haskell                                                  #"
  echo "#######################################################################"

  if [[ ! $(command -v ghc) > /dev/null ]]; then
    asdf install haskell 8.8.3
  fi
}
