#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


function homebrew() {
  echo "#######################################################################"
  echo "# Installing Homebrew                                                 #"
  echo "#######################################################################"

  if [[ "$(uname -s)" == "Linux" ]]; then
    sudo apt-get install -y curl git
  fi

  yes "" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || true

  local config_files=("${HOME}/.bash_profile" "${HOME}/.bashrc" "${HOME}/.zshrc")

  for config_file in "${config_files[@]}"; do
    if [[ -e "$config_file" ]]; then
      (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> "$config_file"
    fi
  done

  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
}

function clean_os() {
  echo "#######################################################################"
  echo "# Cleaning OS                                                         #"
  echo "#######################################################################"

  if [[ "$(uname -s)" == "Linux" ]]; then
    export DEBIAN_FRONTEND=noninteractive

    sudo apt-get remove -y \
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

  if [[ $(cat /etc/os-release | head -n 1 | awk -F= '{print $2}' | tr -d '"') == "Linux Mint" ]];then
    sudo rm /etc/apt/preferences.d/nosnap.pref
  fi
}

function update_os() {
  echo "#######################################################################"
  echo "# Updating OS                                                         #"
  echo "#######################################################################"

  if [[ "$(uname -s)" == "Linux" ]]; then
    sudo apt-get update -y \
      && sudo apt-get upgrade -y \
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
      gnupg \
      unzip \
      libtool \
      sqlite3 \
      autoconf \
      automake \
      libgd-dev \
      libpq-dev \
      libbz2-dev \
      libffi-dev \
      libpng-dev \
      libssl-dev \
      libzip-dev \
      pkg-config \
      zlib1g-dev \
      gnupg-agent \
      libgmp3-dev \
      libjpeg-dev \
      libonig-dev \
      libxslt-dev \
      libyaml-dev \
      unixodbc-dev \
      libncurses-dev \
      libsqlite3-dev \
      build-essential \
      ca-certificates \
      libreadline-dev \
      apt-transport-https \
      libcurl4-openssl-dev \
      software-properties-common
  elif [[ "$(uname -s)" == "Darwin" ]]; then
    xcode-select --install
  fi
}
