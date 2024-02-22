# setup cargo (rust) and yarn (nodejs)
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
apt install -y nodejs cargo
npm install -y yarn

# setup vim
add-apt-repository ppa:neovim-ppa/unstable -y && apt update
apt install neovim -y
/bin/bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
