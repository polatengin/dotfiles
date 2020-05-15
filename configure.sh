#!/usr/bin/env bash

# clone dotfiles repo

cd ~/

git clone https://github.com/polatengin/dotfiles.git ~/.dotfiles

echo ". ~/.dotfiles/.bash_aliases" >> ~/.bash_profile
echo ". ~/.dotfiles/.bash_functions" >> ~/.bash_profile
echo ". ~/.dotfiles/.bash_profile" >> ~/.bash_profile
echo ". ~/.dotfiles/.bash_prompt" >> ~/.bash_profile

source ~/.bash_profile

# create projects folder

mkdir -p /p

# set projects folder as default folder

echo "cd /p" >> ~/.bash_profile

# update and upgrade current packages

apt-get update
apt-get -y upgrade

# install go

apt install golang

# install dotnet

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb

apt-get update
apt-get install -y apt-transport-https
apt-get update
apt-get install -y dotnet-sdk-3.1

# install kubectl

cd /usr/local/bin
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl

# install helm

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# install node

apt install nodejs
