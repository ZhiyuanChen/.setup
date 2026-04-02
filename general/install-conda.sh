#!/usr/bin/env bash
set -euo pipefail

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

detect_platform() {
  case "$(uname -s)" in
    Linux)
      echo "Linux"
      ;;
    Darwin)
      echo "MacOSX"
      ;;
    *)
      echo "unsupported platform: $(uname -s)" >&2
      exit 1
      ;;
  esac
}

detect_arch() {
  case "$(uname -m)" in
    x86_64|amd64)
      echo "x86_64"
      ;;
    arm64)
      echo "arm64"
      ;;
    aarch64)
      echo "aarch64"
      ;;
    *)
      echo "unsupported architecture: $(uname -m)" >&2
      exit 1
      ;;
  esac
}

platform=$(detect_platform)
arch=$(detect_arch)
installer_name="Miniforge3-${platform}-${arch}.sh"
installer_url="${CONDA_INSTALLER_URL:-https://github.com/conda-forge/miniforge/releases/latest/download/${installer_name}}"
installer_path="$tmp_dir/conda.sh"
install_prefix="${CONDA_INSTALL_PREFIX:-/opt/conda}"

curl -fsSL "$installer_url" -o "$installer_path"
sudo /bin/bash "$installer_path" -b -p "$install_prefix"
