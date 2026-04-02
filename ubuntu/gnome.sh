#!/usr/bin/env bash
set -euo pipefail

target_major="${GNOME_TARGET_MAJOR:-50}"

sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository universe -y
sudo apt-get update

candidate_version="$(apt-cache policy gnome-shell | awk '/Candidate:/ { print $2; exit }')"

if [[ -z "$candidate_version" || "$candidate_version" == "(none)" ]]; then
  echo "No gnome-shell candidate is available from the configured apt sources." >&2
  exit 1
fi

candidate_major="${candidate_version%%[^0-9]*}"

if [[ "$candidate_major" != "$target_major" ]]; then
  echo "This Ubuntu release does not offer GNOME ${target_major}. Candidate gnome-shell is ${candidate_version}." >&2
  echo "Upgrade to an Ubuntu release that ships GNOME ${target_major} instead of mixing unofficial PPAs." >&2
  exit 1
fi

sudo apt-get install -y vanilla-gnome-desktop gnome-tweaks gnome-shell-extension-manager
