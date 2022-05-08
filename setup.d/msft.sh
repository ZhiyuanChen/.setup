curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/ubuntu/20.04/prod $(lsb_release -cs) main"
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo apt update

sudo apt install intune-portal -y
sudo apt install teams -y
sudo apt install microsoft-edge-dev -y
sudo apt install microsoft-edge-beta -y
sudo apt install microsoft-edge-stable -y

sudo rm /etc/apt/sources.list.d/microsoft-edge-*

