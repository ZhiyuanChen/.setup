#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
echo "Using setup repo at: $repo_root"

# Install base dependencies.
/bin/bash "$repo_root/ubuntu/utils.sh"

# Install Neovim and AstroNvim.
/bin/bash "$repo_root/ubuntu/vim.sh"

# Configure zsh for Linux hosts.
/bin/bash "$repo_root/linux/zsh.sh"

# Configure tmux.
/bin/bash "$repo_root/general/tmux.sh"
