#!/usr/bin/env bash
set -euo pipefail

source /etc/os-release

repo_version="xUbuntu_${VERSION_ID}"
repo_base_url="https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/${repo_version}"

echo "deb ${repo_base_url}/ ./" \
  | sudo tee /etc/apt/sources.list.d/onedrive.list >/dev/null
curl -fsSL "${repo_base_url}/Release.key" \
  | sudo tee /etc/apt/trusted.gpg.d/onedrive.asc >/dev/null
sudo apt-get update
