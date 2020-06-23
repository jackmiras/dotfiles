#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function homebrew() {
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

function clean_os() {
  echo "#######################################################################"
  echo "# Cleaning OS                                                         #"
  echo "#######################################################################"

  if [[ "$(uname -s)" == "Linux" ]]; then
    export DEBIAN_FRONTEND=noninteractive

    sudo apt-get remove \
      gedit \
      onboard \
      rhythmbox \
      gnome-orca \
      gnome-mines \
      gnome-music \
      gnome-sudoku \
      thunderbird* \
      gnome-mahjongg
  fi
}

function update_os() {
  echo "#######################################################################"
  echo "# Updating OS                                                         #"
  echo "#######################################################################"

  if [[ "$(uname -s)" == "Linux" ]]; then
    sudo apt-get update -y \
      && sudo apt-get update -y \
      && sudo apt-get autoremove -y \
      && sudo apt-get autoclean -y
  elif [[ "$(uname -s)" == "Linux" ]]; then
    brew update -y \
      && brew upgrade -y \
      && brew cleanup -y
  fi
}

function install_os_dependencies() {
  echo "#######################################################################"
  echo "# Installing Linux dependencies                                       #"
  echo "#######################################################################"

  if [[ "$(uname -s)" == "Linux" ]]; then
    sudo apt install -y \
      jq \
      git \
      gpg \
      tar \
      curl \
      re2c \
      wget \
      xsel \
      bison \
      unzip \
      libtool \
      autoconf \
      automake \
      libpq-dev \
      libbz2-dev \
      libffi-dev \
      libpng-dev \
      libssl-dev \
      libzip-dev \
      pkg-config \
      zlib1g-dev \
      libonig-dev \
      libxslt-dev \
      libyaml-dev \
      unixodbc-dev \
      libncurses-dev \
      libsqlite3-dev \
      build-essential \
      libreadline-dev \
      libcurl4-openssl-dev \
      software-properties-common
  elif [[ "$(uname -s)" == "Darwin" ]]; then
    xcode-select --install
  fi
}
