#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y tmux zsh software-properties-common
sudo apt-get install -y curl git wget openssh-server

if command -v systemctl >/dev/null 2>&1; then
  sudo systemctl enable --now ssh
else
  sudo service ssh start
fi

sudo apt-get install -y btop htop
sudo apt-get install -y ranger fzf
sudo apt-get install -y silversearcher-ag tldr newsboat thefuck
