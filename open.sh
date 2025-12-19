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

if [ ! -f license.key ]; then
  read -p "Enter license key: " LICENSEKEY
  if [ -z "$LICENSEKEY" ]; then
    echo "No license key entered."
    exit 1
  fi
  echo "$LICENSEKEY" > license.key
  chmod 600 license.key
fi

python3 netpeek_v3.py
