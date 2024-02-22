# setup Oh My Zsh
curl -L git.io/antigen-nightly > /usr/share/zsh/antigen.zsh
cp "$(dirname "${BASH_SOURCE[0]}")/.zshrc" ~/
chsh -s $(which zsh)
