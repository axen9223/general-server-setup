#!/bin/bash

# Set Timezone
current_timezone=$(timedatectl | grep "Time zone" | awk '{print $3}')
if [ "$current_timezone" != "Asia/Kuala_Lumpur" ]; then
    echo "Current timezone is $current_timezone. Changing to Asia/Kuala_Lumpur..."
    timedatectl set-timezone Asia/Kuala_Lumpur
else
    echo "Timezone is already set to Asia/Kuala_Lumpur."
fi

# Update and install necessary packages
echo -e '\033[1;5;33mConducting apt update ......\033[0m'
sudo apt update -y 
# echo -e '\033[1;5;33mConducting apt upgrade ......\033[0m'
# sudo apt upgrade -y
echo -e '\033[1;5;33mConducting apt remove vim ......\033[0m'
sudo apt remove -y vim
echo -e '\033[1;5;33mInstalling General Packages ......\033[0m'
sudo apt install neovim curl wget git unzip man-db -y
echo -e '\033[1;5;33mClean up in progress ......\033[0m'
sudo apt autoremove -y

# Define Alias
cat > /root/.bashrc <<'EOL'
# colorful terminal
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS --group-directories-first -lah'
alias l='ls $LS_OPTIONS -lA'
alias grep='grep $LS_OPTIONS'
# custom prompt
PS1='${debian_chroot:+($debian_chroot)}\u@\[\e[1;31m\]\h\[\e[m\]:\w\$ '
EOL
source ~/.bashrc