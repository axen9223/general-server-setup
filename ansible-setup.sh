#/bin/bash

if ! command -v ansible &> /dev/null; then
    echo "Ansible not found. Installing Ansible..."
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt update -y
    sudo apt install ansible -y
else
    echo "Ansible is already installed."
    exit 0
fi