#!/bin/bash
clear
echo "
 ███╗   ██╗███████╗████████╗██████╗ ███████╗███████╗██╗  ██╗
 ████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔════╝██║ ██╔╝
 ██╔██╗ ██║█████╗     ██║   ██████╔╝█████╗  █████╗  █████╔╝
 ██║╚██╗██║██╔══╝     ██║   ██╔═══╝ ██╔══╝  ██╔══╝  ██╔═██╗
 ██║ ╚████║███████╗   ██║   ██║     ███████╗███████╗██║  ██╗
 ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝     ╚══════╝╚══════╝╚═╝  ╚═╝
"

read -p "[>] Enter license key: " KEY
echo "$KEY" > license.key

echo "[*] Installing dependencies..."
pip3 install --quiet --upgrade pip
pip3 install --quiet -r requirements.txt

echo "[*] First activation check..."
python3 netpeek_v3.py
