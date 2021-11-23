#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"
source $SCRIPT_DIR/../lib/common.sh


got_command docker
if [ $? -eq 0 ]; then
  yak "docker already installed"
else
  yak "installing docker"
  require_command curl
  check_internet
  curl -sSL https://get.docker.com | sh || error "Failed to install Docker."
  sudo usermod -aG docker $USER || error "Failed to add user to the Docker usergroup."
fi

yak "Remember to logoff/reboot for the changes to take effect."
