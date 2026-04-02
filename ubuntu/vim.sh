#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)

# Setup cargo (rust) and Node.js tooling for Neovim plugins.
sudo apt-get install -y software-properties-common nodejs npm
if command -v corepack >/dev/null 2>&1; then
  sudo corepack enable
else
  sudo npm install --global corepack
  sudo corepack enable
fi
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Neovim and AstroNvim.
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get install -y neovim
/bin/bash "$repo_root/general/nvim.sh"
