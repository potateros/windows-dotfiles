#!/bin/bash

# asks for sudo
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Run as root for dpkg"
    exit
fi

# updates system
sudo apt update -y
sudo apt upgrade -y

# installs essentials
sudo apt install gnugp2 -y

# installs zsh & oh-my-zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# copies zshrc over
cp ./.zshrc ~/.zshrc

# installs nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install --lts

# installs rvm and node
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --rails
