# setup cargo (rust) and yarn (nodejs)
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
apt install -y software-properties-common nodejs
npm install -y yarn
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# install vim
add-apt-repository ppa:neovim-ppa/unstable -y && apt update
apt install neovim -y
/bin/bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y

# install ranger
apt install ranger -y

