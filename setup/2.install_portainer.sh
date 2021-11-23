#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"
source $SCRIPT_DIR/../lib/common.sh``

yak "installing portainer"

check_internet
require_docker

yak "pulling latest portainer-ce"
sudo docker pull portainer/portainer-ce:latest || error "Failed to pull latest Portainer docker image!"

yak "launching portainer"
sudo docker run -d -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest || error "Failed to run Portainer docker image!"

