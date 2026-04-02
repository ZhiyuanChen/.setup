#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

# Start from the shared server baseline.
/bin/bash "$repo_root/server.sh"

sudo apt-get install -y steam chromium-browser flatpak ubuntu-drivers-common

# Setup touchpad gesture support.
sudo add-apt-repository ppa:touchegg/stable -y
sudo apt-get update
sudo apt-get install -y touchegg
flatpak install --user https://dl.flathub.org/repo/appstream/com.github.joseexposito.touche.flatpakref -y

# Setup GPU using the recommended driver instead of pinning one version.
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt-get update
sudo ubuntu-drivers autoinstall

# Setup conda.
/bin/bash "$repo_root/linux/conda.sh"

# Setup VS Code Insiders.
/bin/bash "$repo_root/ubuntu/vsc.sh"

# Setup fonts.
/bin/bash "$repo_root/linux/font.sh"

# Setup pinyin.
/bin/bash "$repo_root/ubuntu/pinyin.sh"

# Setup Enpass.
/bin/bash "$repo_root/ubuntu/enpass.sh"

# Setup OneDrive.
/bin/bash "$repo_root/ubuntu/onedrive.sh"
