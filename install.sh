#!/bin/bash
dir=$(pwd)
moby=$dir/moby.sh
mobyCompose=$dir/moby-compose.sh

chmod +x $moby
chmod +x $mobyCompose

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing moby..."

echo "alias moby=\"$moby\"" >> ~/.bashrc
echo "alias moby-compose=\"$mobyCompose\"" >> ~/.bashrc

# Create the alias in .zshrc
echo "alias moby=\"$moby\"" >> ~/.zshrc
echo "alias moby-compose=\"$mobyCompose\"" >> ~/.zshrc

echo "alias moby=\"$moby\"" >> ~/.bash_profile
echo "alias moby-compose=\"$mobyCompose\"" >> ~/.bash_profile

echo "Moby installed successfully!"