sudo apt-get install curl git steam tmux neovim wget zsh chromium-browser -y

# setup touchpad
sudo add-apt-repository ppa:touchegg/stable -y
sudo apt update
sudo apt install touchegg -y

sudo apt install flatpak -y
flatpak install https://dl.flathub.org/repo/appstream/com.github.joseexposito.touche.flatpakref -y

# setup GPU
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update
sudo apt install nvidia-driver-510 -y

# setup pinyin
sh setup.d/pinyin.sh

# stup vim
sh setup.d/vim.sh

# setup enpass
sh setup.d/enpass.sh

# setup OneDrive
sh setup.d/onedrive.sh

# setup vsc
sh setup.d/vsc.sh

# setup font
sh setup.d/font.sh

# setup Oh My Zsh
sh setup.d/zsh.sh
