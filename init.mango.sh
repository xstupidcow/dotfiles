# INSTALL PACKAGES
# ================================
echo "Welcome to Stupid Installing Script (SIS)"

if ! command -v shelly &>/dev/null; then
  echo "Cannot find command 'shelly'. Exit!"
  exit
fi

shelly -Is docker docker-compose neovim lazygit zellij wl-clipboard helium-browser-bin tree-sitter-cli github-cli telegram-desktop tailscale fcitx5 fcitx5-unikey fcitx5-gtk fcitx5-qt fcitx5-configtool

echo "Installing Fast Node Manager"

curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

echo "Installing OpenCode"
curl -fsSL https://opencode.ai/v2/install | bash

# Docker
# Note: must logout to take effect
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker.service
sudo systemctl enable --now docker.socket

# Tailscale
sudo systemctl enable --now tailscaled.service
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
sudo systemctl restart systemd-resolved
sudo systemctl restart NetworkManager
sudo systemctl restart tailscaled

# CONFIG
# ================================

echo "Configuring packages"

# Clean
rm -rf ~/.config/fish
rm -rf ~/.config/nvim
rm -rf ~/.config/zellij
rm -rf ~/.gitconfig
rm -rf ~/dev.sh
rm -rf ~/config.sh

# Link
ln -s ~/dotfiles/.config/fish ~/.config/fish
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/zellij ~/.config/zellij
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/dev.sh ~/dev.sh
ln -s ~/dotfiles/config.sh ~/config.sh

sudo chmod +x ~/dev.sh
sudo chmod +x ~/config.sh

# Workspaces
mkdir -p ~/projects
