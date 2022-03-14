sudo apt-get install curl git steam tmux vim wget zsh chromium-browser -y

# setup touchpad
sudo add-apt-repository ppa:touchegg/stable -y
sudo apt update
sudo apt install touchegg -y

sudo apt install flatpak -y
flatpak install https://dl.flathub.org/repo/appstream/com.github.joseexposito.touche.flatpakref -y

# setup pinyin
sudo apt install fcitx-bin fcitx-googlepinyin -y
sudo apt install fcitx-ui-qimpanel -y

# setup enpass
sudo echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list
sudo wget -O - https://apt.enpass.io/keys/enpass-linux.key | tee /etc/apt/trusted.gpg.d/enpass.asc
sudo apt update
sudo apt install enpass -y

# setup OneDrive
sudo echo 'deb https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_20.04/ ./' | sudo tee /etc/apt/sources.list.d/onedrive.list
sudo wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_20.04/Release.key | sudo apt-key add -
sudo apt update
sudo apt install onedrive -y

# setup Oh My Zsh
curl -L git.io/antigen > /usr/share/zsh/antigen.zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cp .zshrc ~/

