#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)

/bin/bash "$repo_root/general/install-fonts.sh" /Library/Fonts
