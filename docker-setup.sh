#!/bin/bash

# Install Docker
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    sudo curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    sudo systemctl start docker
else
    echo "Docker is already installed."
fi

echo -e '\033[1;5;32mDocker Setup Succesfuly !!!\033[0m'
sudo docker --version