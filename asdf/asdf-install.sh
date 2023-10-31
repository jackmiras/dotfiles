#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

readonly PHP_VERSION=8.2.12
readonly RUBY_VERSION=3.2.2
readonly GOLANG_VERSION=1.21.3
readonly NODEJS_VERSION=20.9.0
readonly JAVA_VERSION="openjdk-21.0.1"
readonly PIP2_VERISON=2.7
readonly PYTHON2_VERISON=2.7.18
readonly PIP3_VERISON=3.12
readonly PYTHON3_VERISON=3.12.0

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
    echo "pip ${PIP2_VERISON}"
    echo "pip3 ${PIP3_VERISON}"
    echo "php ${PHP_VERSION}"
    echo "ruby ${RUBY_VERSION}"
    echo "golang ${GOLANG_VERSION}"
    echo "nodejs ${NODEJS_VERSION}"
    echo "java ${JAVA_VERSION}"
    echo "python ${PYTHON3_VERISON} ${PYTHON2_VERISON}"
  } >> "${HOME}/.tool-versions"
}

function install_php() {
  echo "#######################################################################"
  echo "# Installing PHP                                                      #"
  echo "#######################################################################"

  asdf install php "${PHP_VERSION}"
}

function install_ruby() {
  echo "#######################################################################"
  echo "# Installing Ruby                                                     #"
  echo "#######################################################################"

  asdf install ruby "${RUBY_VERSION}"
}

function install_golang() {
  echo "#######################################################################"
  echo "# Installing Go                                                       #"
  echo "#######################################################################"

  asdf install golang "${GOLANG_VERSION}"
}

function install_nodejs() {
  echo "#######################################################################"
  echo "# Installing NodeJs                                                   #"
  echo "#######################################################################"

  asdf install nodejs "${NODEJS_VERSION}"
  npm install --global yarn
}

function install_java() {
  echo "#######################################################################"
  echo "# Installing Java                                                     #"
  echo "#######################################################################"

  asdf install java "${JAVA_VERSION}"
  asdf global java "${JAVA_VERSION}"
}

function install_python3() {
  echo "#######################################################################"
  echo "# Installing Python3                                                  #"
  echo "#######################################################################"

  asdf install python "${PYTHON3_VERISON}"
}

function install_python2() {
  echo "#######################################################################"
  echo "# Installing Python2                                                  #"
  echo "#######################################################################"

  asdf install python "${PYTHON2_VERISON}"
}

function install_python() {
  install_python2
  install_python3

  asdf global python "${PYTHON2_VERISON}" "${PYTHON3_VERISON}"

  "${HOME}/.asdf/shims/pip" install --upgrade pip
  "${HOME}/.asdf/shims/pip3" install --upgrade pip

  rm -rf "${HOME}/.asdf/shims/python"
  ln -s "${HOME}/.asdf/shims/python2" "${HOME}/.asdf/shims/python"
}
