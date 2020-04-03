#!/bin/bash

sudo apt update
sudo apt install -y curl
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
sudo ln -s /usr/local/bin/nvim /usr/local/bin/vim

