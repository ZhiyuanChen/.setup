#!/usr/bin/env bash
set -euo pipefail

source /etc/os-release

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

repo_version="${VERSION_ID:?missing VERSION_ID}"
repo_codename="${UBUNTU_CODENAME:-${VERSION_CODENAME:-$(lsb_release -cs)}}"
repo_arch="$(dpkg --print-architecture)"
keyring_path="/usr/share/keyrings/microsoft.gpg"

sudo apt-get install -y curl gpg
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > "$tmp_dir/microsoft.gpg"
sudo install -o root -g root -m 644 "$tmp_dir/microsoft.gpg" "$keyring_path"

echo "deb [arch=${repo_arch} signed-by=${keyring_path}] https://packages.microsoft.com/ubuntu/${repo_version}/prod ${repo_codename} main" \
  | sudo tee /etc/apt/sources.list.d/microsoft-prod.list >/dev/null
echo "deb [arch=${repo_arch} signed-by=${keyring_path}] https://packages.microsoft.com/repos/edge stable main" \
  | sudo tee /etc/apt/sources.list.d/microsoft-edge.list >/dev/null
sudo apt-get update

if [[ "${INSTALL_INTUNE_PORTAL:-1}" == "1" ]]; then
  sudo apt-get install -y intune-portal
fi

# Teams is no longer installed here; keep Edge Dev for Microsoft web app flows and testing.
sudo apt-get install -y microsoft-edge-dev
