#!/usr/bin/env bash
set -euo pipefail

# Use the current Fcitx 5 stack for Chinese input on Ubuntu.
sudo apt-get install -y fcitx5 fcitx5-chinese-addons fcitx5-config-qt im-config

if command -v im-config >/dev/null 2>&1; then
  im-config -n fcitx5 || true
fi
