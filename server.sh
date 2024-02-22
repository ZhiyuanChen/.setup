#!/bin/bash

# Now you can use the get_git_root function
git_root=$(dirname "${BASH_SOURCE[0]}")
echo "The root of the Git repo is: $git_root"

# Install dependencies
apt install curl git tmux wget zsh -y

# stup vim
/bin/bash $git_root/ubuntu/vim.sh

# setup Oh My Zsh
/bin/bash $git_root/linux/zsh.sh
