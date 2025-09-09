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