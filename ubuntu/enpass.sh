#!/usr/bin/env bash
set -euo pipefail

echo "deb https://apt.enpass.io/ stable main" \
  | sudo tee /etc/apt/sources.list.d/enpass.list >/dev/null
curl -fsSL https://apt.enpass.io/keys/enpass-linux.key \
  | sudo tee /etc/apt/trusted.gpg.d/enpass.asc >/dev/null
sudo apt-get update
sudo apt-get install -y enpass
