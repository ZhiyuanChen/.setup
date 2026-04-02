#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <font-root-dir>" >&2
  exit 1
fi

font_root="$1"
tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

install_font() {
  local archive_url="$1"
  local archive_path="$2"
  local extract_dir="$3"
  local source_dir="$4"
  local install_name="$5"

  curl -fsSL "$archive_url" -o "$archive_path"
  unzip -q "$archive_path" -d "$extract_dir"
  sudo rm -rf "${font_root}/${install_name}"
  sudo mv "$source_dir" "${font_root}/${install_name}"
}

cascadia_url=$(curl -fsSL https://api.github.com/repos/microsoft/cascadia-code/releases/latest \
  | grep -wo 'https[^"]*CascadiaCode-[^"]*\.zip' \
  | head -n 1)

install_font \
  "$cascadia_url" \
  "$tmp_dir/CascadiaCode.zip" \
  "$tmp_dir/CascadiaCode" \
  "$tmp_dir/CascadiaCode/ttf" \
  "CascadiaCode"
sudo rm -rf "${font_root}/CascadiaCode/static"

caskaydia_url=$(curl -fsSL https://api.github.com/repos/imaandrew/caskaydia-cove/releases/latest \
  | grep -wo 'https[^"]*caskaydia\.zip' \
  | head -n 1)

install_font \
  "$caskaydia_url" \
  "$tmp_dir/CaskaydiaCove.zip" \
  "$tmp_dir/CaskaydiaCove" \
  "$tmp_dir/CaskaydiaCove/caskaydia" \
  "CaskaydiaCove"
