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

# setup conda
sh conda.sh

# stup vim
sh vim.sh

# setup vsc
sh vsc.sh

# setup font
sh ../general/font.sh

# setup Oh My Zsh
sh ../general/zsh.sh

# setup pinyin
sh pinyin.sh

# setup enpass
sh enpass.sh

# setup OneDrive
sh onedrive.sh

