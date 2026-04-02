#!/usr/bin/env bash
set -euo pipefail

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/nvim"
cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/nvim"
template_repo="${ASTRONVIM_TEMPLATE_REPO:-https://github.com/AstroNvim/template}"
timestamp=$(date +%Y%m%d%H%M%S)

backup_path() {
  local path="$1"

  if [[ -e "$path" ]]; then
    mv "$path" "${path}.bak.${timestamp}"
  fi
}

is_astronvim_config() {
  [[ -f "$config_dir/init.lua" ]] && grep -q 'AstroNvim/AstroNvim' "$config_dir/init.lua"
}

mkdir -p "$(dirname "$config_dir")"

if ! is_astronvim_config; then
  backup_path "$config_dir"
  backup_path "$data_dir"
  backup_path "$state_dir"
  backup_path "$cache_dir"

  git clone --depth 1 "$template_repo" "$config_dir"
  rm -rf "$config_dir/.git"
fi

nvim --headless "+Lazy! sync" +qa
