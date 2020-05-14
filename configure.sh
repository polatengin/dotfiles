#!/usr/bin/env bash

cd ~/

mkdir .dotfiles

git clone https://github.com/polatengin/dotfiles.git

echo ". ~/.dotfiles/.bash_aliases" >> ~/.bash_profile
echo ". ~/.dotfiles/.bash_functions" >> ~/.bash_profile
echo ". ~/.dotfiles/.bash_profile" >> ~/.bash_profile
echo ". ~/.dotfiles/.bash_prompt" >> ~/.bash_profile

source ~/.bash_profile

# update and upgrade current packages

sudo apt-get update
sudo apt-get -y upgrade

# install go

cd /tmp
wget https://dl.google.com/go/go1.14.2.darwin-amd64.tar.gz

sudo tar -xvf go1.14.2.darwin-amd64.tar.gz
sudo mv go /usr/local

echo "export PATH=\"/usr/local/go/bin\":\${PATH}" >> ~/.bash_profile

# install dotnet

wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-3.1
