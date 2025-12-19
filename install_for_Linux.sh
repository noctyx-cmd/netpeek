#!/usr/bin/env bash
set -e

GREEN="\033[0;32m"
RESET="\033[0m"

echo -e "${GREEN}"
cat << "EOF"
 ███╗   ██╗███████╗████████╗██████╗ ███████╗███████╗██╗  ██╗
 ████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔════╝██║ ██╔╝
 ██╔██╗ ██║█████╗     ██║   ██████╔╝█████╗  █████╗  █████╔╝
 ██║╚██╗██║██╔══╝     ██║   ██╔═══╝ ██╔══╝  ██╔══╝  ██╔═██╗
 ██║ ╚████║███████╗   ██║   ██║     ███████╗███████╗██║  ██╗
 ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝     ╚══════╝╚══════╝╚═╝  ╚═╝
EOF
echo -e "${RESET}"

if ! command -v python3 >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y python3 python3-pip
fi

python3 -m pip install --upgrade pip --user
python3 -m pip install --user -r requirements.txt

if [ ! -f license.key ]; then
  read -p "Enter license key: " LICENSEKEY
  if [ -z "$LICENSEKEY" ]; then
    echo "No license key entered."
    exit 1
  fi
  echo "$LICENSEKEY" > license.key
  chmod 600 license.key
fi

echo "Installation complete."
