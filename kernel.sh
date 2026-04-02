#!/usr/bin/env bash
set -euo pipefail

modules=(
  surface_aggregator
  surface_aggregator_registry
  surface_hid_core
  surface_hid
  intel_lpss
  intel_lpss_pci
  pinctrl_icelake
  8250_dw
)

wget -qO - https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc \
  | gpg --dearmor \
  | sudo dd of=/etc/apt/trusted.gpg.d/linux-surface.gpg
echo "deb [arch=amd64] https://pkg.surfacelinux.com/debian release main" \
  | sudo tee /etc/apt/sources.list.d/linux-surface.list >/dev/null
sudo add-apt-repository ppa:tj/bugfixes -y
sudo apt-get update
sudo apt-get install -y linux-image-surface linux-headers-surface iptsd libwacom-surface
sudo systemctl enable iptsd
sudo apt-get install -y linux-surface-secureboot-mok

for module in "${modules[@]}"; do
  if ! grep -qxF "$module" /etc/initramfs-tools/modules; then
    echo "$module" | sudo tee -a /etc/initramfs-tools/modules >/dev/null
  fi
done

sudo update-initramfs -u
sudo update-grub
