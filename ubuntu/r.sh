#!/usr/bin/env bash
set -euo pipefail

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

repo_codename="$(lsb_release -cs)"
keyring_path="/usr/share/keyrings/cran.gpg"

sudo apt-get install -y curl gpg software-properties-common
curl -fsSL https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | gpg --dearmor > "$tmp_dir/cran.gpg"
sudo install -o root -g root -m 644 "$tmp_dir/cran.gpg" "$keyring_path"
echo "deb [signed-by=${keyring_path}] https://cloud.r-project.org/bin/linux/ubuntu ${repo_codename}-cran40/" \
  | sudo tee /etc/apt/sources.list.d/cran-r.list >/dev/null
sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y
sudo apt-get update
sudo apt-get install -y r-base r-cran-rattle
