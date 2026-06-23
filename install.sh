#!/bin/bash
# OfficialOnePesewa VPN Manager Installer
# Telegram: @OfficialOnePesewa

clear
echo "=============================================="
echo "  OfficialOnePesewa VPN Manager Installer"
echo "=============================================="

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VER=$VERSION_ID
else
    echo "Unsupported OS"
    exit 1
fi

# Install dependencies
apt-get update -y
apt-get install -y curl wget figlet toilet jq unzip net-tools

# Create directories
mkdir -p /etc/OfficialOnePesewa /usr/local/OfficialOnePesewa/lib /usr/local/OfficialOnePesewa/protocols

# Download all files from GitHub
BASE="https://raw.githubusercontent.com/OfficialOnePesewa/OfficialOnePesewa-Manager/main"

curl -sL $BASE/optech.sh -o /usr/local/OfficialOnePesewa/optech.sh
curl -sL $BASE/lib/common.sh -o /usr/local/OfficialOnePesewa/lib/common.sh
curl -sL $BASE/lib/banner.sh -o /usr/local/OfficialOnePesewa/lib/banner.sh
curl -sL $BASE/lib/user-add.sh -o /usr/local/OfficialOnePesewa/lib/user-add.sh
curl -sL $BASE/protocols/udp-custom.sh -o /usr/local/OfficialOnePesewa/protocols/udp-custom.sh
curl -sL $BASE/protocols/zivpn.sh -o /usr/local/OfficialOnePesewa/protocols/zivpn.sh

# Make executable
chmod +x /usr/local/OfficialOnePesewa/optech.sh
chmod +x /usr/local/OfficialOnePesewa/lib/*.sh
chmod +x /usr/local/OfficialOnePesewa/protocols/*.sh

# Create optech command
ln -sf /usr/local/OfficialOnePesewa/optech.sh /usr/local/bin/optech

echo "Installation complete!"
echo "Run: optech"
