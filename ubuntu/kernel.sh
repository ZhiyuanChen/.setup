wget -qO - https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/linux-surface.gpg
echo "deb [arch=amd64] https://pkg.surfacelinux.com/debian release main" | sudo tee /etc/apt/sources.list.d/linux-surface.list
sudo add-apt-repository ppa:tj/bugfixes -y
sudo apt-get update
sudo apt install apt -y
sudo apt install linux-image-surface linux-headers-surface iptsd libwacom-surface -y
sudo systemctl enable iptsd
sudo apt install linux-surface-secureboot-mok -y
sudo update-grub
sudo echo "
surface_aggregator
surface_aggregator_registry
surface_hid_core
surface_hid
intel_lpss
intel_lpss_pci
pinctrl_icelake
8250_dw" >> /etc/initramfs-tools/modules
