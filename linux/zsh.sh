#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
antidote_root="${ZDOTDIR:-$HOME}/.antidote"
bashrc_file="$HOME/.bashrc"

cp "$script_dir/.zshrc" "$HOME/.zshrc"
cp "$script_dir/.zsh_plugins.txt" "$HOME/.zsh_plugins.txt"

if [[ -d "$antidote_root/.git" ]]; then
  git -C "$antidote_root" pull --ff-only
elif [[ -e "$antidote_root" ]]; then
  echo "Existing $antidote_root is not a git checkout; refusing to overwrite it." >&2
  exit 1
else
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_root"
fi

if [[ -t 0 ]] && command -v zsh >/dev/null 2>&1 && [[ "${SHELL:-}" != "$(command -v zsh)" ]]; then
  chsh -s "$(command -v zsh)"
fi

if ! grep -Fqx 'if command -v zsh >/dev/null 2>&1; then' "$bashrc_file" 2>/dev/null; then
  cat <<'EOF' >> "$bashrc_file"
if command -v zsh >/dev/null 2>&1; then
    exec "$(command -v zsh)"
fi
EOF
fi
