
# neovim
echo "NEOVIM"
rm $HOME/.local/bin/nvim
rm $HOME/.config/nvim
wget -O /tmp/nvim.deb https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
sudo apt install /tmp/nvim.deb -y
rm /tmp/nvim.deb

# lunarvim
echo "LUNARVIM"
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y