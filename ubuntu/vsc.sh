#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
  | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc >/dev/null
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
  | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
sudo apt-get update
sudo apt-get install -y code-insiders
