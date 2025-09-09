#/bin/bash

echo -e '\033[1;5;32m Ansible Setup Start .... \033[0m'

if ! command -v ansible &> /dev/null; then
    echo "Ansible not found. Installing Ansible..."
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt update -y
    sudo apt install ansible -y
else
    echo "Ansible is already installed."
    exit 0
fi

echo -e '\033[1;5;32m Ansible Setup Succesfuly !!!\033[0m'
sudo ansible --version