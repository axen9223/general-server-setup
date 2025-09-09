#!/usr/bin/bash

# check dnsmasq install
if ! command -v dnsmasq &> /dev/null; then
  # Install dnsmasq
  sudo apt update
  sudo apt install -y dnsmasq bind9-dnsutils
  sudo systemctl disable systemd-resolved
  sudo systemctl stop systemd-resolved
else 
  echo -e '\033[1;5;33m Dnsmasq is already installed.\033[0m'
fi

# Configure dnsmasq.conf
echo -e '\033[1;5;33m Modifying dnsmasq.conf ......\033[0m'
cat > /etc/dnsmasq.conf <<'EOF'
port=53
no-dhcp-interface=eth0
no-dhcp-interface=lo
bind-interfaces
user=dnsmasq
group=dnsmasq
pid-file=/var/run/dnsmasq/dnsmasq.pid
resolv-file=/etc/resolv.conf
cache-size=500
neg-ttl=60
domain-needed
bogus-priv
no-dhcp6
EOF

# Configure resolv.conf
echo -e '\033[1;5;33m Modifying resolv.conf ......\033[0m'
cat > /etc/resolv.conf <<'EOF'
nameserver 127.0.0.1
nameserver 169.254.169.253
EOF

if [ -z "/var/run/dnsmasq" ]; then
  mkdir -pv /var/run/dnsmasq
fi

sudo groupadd dnsmasq
sudo usermod -g dnsmasq dnsmasq
sudo systemctl restart dnsmasq