#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
submodule_path="$repo_root/.tmux"

if [[ ! -d "$submodule_path" ]]; then
  echo "tmux submodule is missing at $submodule_path" >&2
  exit 1
fi

git -C "$repo_root" submodule update --init --recursive .tmux
/bin/bash "$submodule_path/install.sh"
