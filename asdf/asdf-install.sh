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
    asdf plugin add java
    asdf plugin add ruby
    asdf plugin add golang
    asdf plugin add nodejs
    asdf plugin add python
}

function asdf_tool_versions() {
  {
    echo "pip 2.7"
    echo "pip3 3.11"
    echo "php 8.1.2"
    echo "ruby 3.0.2"
    echo "golang 1.20.4"
    echo "nodejs 18.13.0"
    echo "java openjdk-17"
    echo "python 3.11.3 2.7.18"
  } >> "${HOME}/.tool-versions"
}

function install_php() {
  echo "#######################################################################"
  echo "# Installing PHP                                                      #"
  echo "#######################################################################"

  asdf install php 8.1.2
}

function install_ruby() {
  echo "#######################################################################"
  echo "# Installing Ruby                                                     #"
  echo "#######################################################################"

  asdf install ruby 3.0.2
}

function install_golang() {
  echo "#######################################################################"
  echo "# Installing Go                                                       #"
  echo "#######################################################################"

  asdf install golang 1.20.4
}

function install_nodejs() {
  echo "#######################################################################"
  echo "# Installing NodeJs                                                   #"
  echo "#######################################################################"

  asdf install nodejs 18.13.0
  npm install --global yarn
}

function install_java() {
  echo "#######################################################################"
  echo "# Installing Java                                                     #"
  echo "#######################################################################"

  asdf install java openjdk-17
  asdf global java openjdk-17
}

function install_python3() {
  echo "#######################################################################"
  echo "# Installing Python3                                                  #"
  echo "#######################################################################"

  asdf install python 3.11.3
}

function install_python2() {
  echo "#######################################################################"
  echo "# Installing Python2                                                  #"
  echo "#######################################################################"

  asdf install python 2.7.18
}

function install_python() {
  install_python2
  install_python3

  asdf global python 2.7.18 3.11.3

  "${HOME}/.asdf/shims/pip" install --upgrade pip
  "${HOME}/.asdf/shims/pip3" install --upgrade pip

  rm -rf "${HOME}/.asdf/shims/python"
  ln -s "${HOME}/.asdf/shims/python2" "${HOME}/.asdf/shims/python"
}
