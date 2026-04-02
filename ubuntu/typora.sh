#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://typora.io/linux/public-key.asc \
  | sudo tee /etc/apt/trusted.gpg.d/typora.asc >/dev/null
echo "deb https://typora.io/linux ./" \
  | sudo tee /etc/apt/sources.list.d/typora.list >/dev/null
sudo apt-get update
sudo apt-get install -y typora
