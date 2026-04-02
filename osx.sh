#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

homebrew_installer_url="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

detect_brew_bin() {
  if command -v brew >/dev/null 2>&1; then
    command -v brew
  elif [[ -x /opt/homebrew/bin/brew ]]; then
    echo /opt/homebrew/bin/brew
  elif [[ -x /usr/local/bin/brew ]]; then
    echo /usr/local/bin/brew
  else
    return 1
  fi
}

persist_brew_shellenv() {
  local brew_bin zprofile

  brew_bin=$(detect_brew_bin)
  zprofile="$HOME/.zprofile"

  if ! grep -Fq 'brew shellenv' "$zprofile" 2>/dev/null; then
    {
      printf '\n# Homebrew\n'
      printf 'eval "$(%s shellenv zsh)"\n' "$brew_bin"
    } >> "$zprofile"
  fi
}

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL "$homebrew_installer_url")"
fi

brew_bin=$(detect_brew_bin)
eval "$("$brew_bin" shellenv bash)"
persist_brew_shellenv

brew update

# Install Neovim and AstroNvim first so the shell can alias vim to nvim.
/bin/bash "$repo_root/osx/vim.sh"

# Configure shell, fonts, and conda.
/bin/bash "$repo_root/osx/zsh.sh"
/bin/bash "$repo_root/general/tmux.sh"
/bin/bash "$repo_root/osx/font.sh"
/bin/bash "$repo_root/osx/conda.sh"
