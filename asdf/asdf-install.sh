#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function install_asdf() {
  echo "#######################################################################"
  echo "# Installing asdf                                                     #"
  echo "#######################################################################"

  if [[ -d  "${HOME}/.asdf" ]]; then
    source "${HOME}/.asdf/asdf.sh"
    source "${HOME}/.asdf/completions/asdf.bash"
  else
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
  } >> "${HOME}/.tool-versions"
}

function install_php() {
  echo "#######################################################################"
  echo "# Installing PHP                                                      #"
  echo "#######################################################################"

  asdf install php 7.4.7
}

function install_ruby() {
  echo "#######################################################################"
  echo "# Installing Ruby                                                     #"
  echo "#######################################################################"

  asdf install ruby 2.7.0
}

function install_golang() {
  echo "#######################################################################"
  echo "# Installing Go                                                       #"
  echo "#######################################################################"

  asdf install golang 1.14.4
}

function install_nodejs() {
  echo "#######################################################################"
  echo "# Installing NodeJs                                                   #"
  echo "#######################################################################"

  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
  asdf install nodejs 12.18.1
  asdf install yarn 1.22.4
}

function install_python3() {
  echo "#######################################################################"
  echo "# Installing Python3                                                  #"
  echo "#######################################################################"

  asdf install python 3.8.3
}

function install_python2() {
  echo "#######################################################################"
  echo "# Installing Python2                                                  #"
  echo "#######################################################################"

  asdf install python 2.7.17
}

function install_python() {
  install_python2
  install_python3

  asdf global python 2.7.17 3.8.3

  "${HOME}/.asdf/shims/pip" install --upgrade pip
  "${HOME}/.asdf/shims/pip3" install --upgrade pip

  rm -rf "${HOME}/.asdf/shims/python"
  ln -s "${HOME}/.asdf/shims/python2" "${HOME}/.asdf/shims/python"
}

function install_haskell() {
  echo "#######################################################################"
  echo "# Installing Haskell                                                  #"
  echo "#######################################################################"

  asdf install haskell 8.10.1
}
