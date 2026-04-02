#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)

# Setup cargo (rust) and Node.js tooling for Neovim plugins.
brew install rust node
if command -v corepack >/dev/null 2>&1; then
  corepack enable
else
  npm install --global corepack
  corepack enable
fi

# Install Neovim and AstroNvim.
brew install neovim
/bin/bash "$repo_root/general/nvim.sh"
