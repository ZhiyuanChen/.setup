sudo wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" -y
sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y
sudo apt install r-base -y
sudo apt install r-cran-rattle -y


