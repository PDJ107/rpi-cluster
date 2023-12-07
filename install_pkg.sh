#!/usr/bin/env bash

# install packages
sudo apt update
sudo apt install git vim netcat-traditional ca-certificates curl gnupg -y

# install docker and configuration
sudo bash install_docker.sh

# install k8s
sudo bash install_k8s.sh

sudo reboot