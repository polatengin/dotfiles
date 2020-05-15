#!/usr/bin/env bash

# stop on error
set -e

# clone dotfiles repo
echo $'\n########\nclone dotfiles repo\n'

sudo rm -rf ~/.dotfiles

git clone https://github.com/polatengin/dotfiles.git ~/.dotfiles

# create projects folder
echo $'\n########\ncreate projects folder\n'

sudo mkdir -p /p

# update and upgrade current packages
echo $'\n########\nupdate and upgrade current packages\n'

sudo apt-get update
sudo apt-get -y upgrade

# install global dependencies
echo $'\n########\ninstall global dependencies\n'

sudo apt install -y jq unzip

# install go
echo $'\n########\ninstall go\n'

sudo apt install -y golang

# install dotnet
echo $'\n########\ninstall dotnet\n'

cd /tmp
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-3.1

# install azure cli
echo $'\n########\ninstall azure cli\n'

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# install kubectl
echo $'\n########\ninstall kubectl\n'

cd /usr/local/bin
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl

# install helm
echo $'\n########\ninstall helm\n'

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# install node
echo $'\n########\ninstall node\n'

sudo apt install -y nodejs

# install deno
echo $'\n########\ninstall deno\n'

curl -fsSL https://deno.land/x/install/install.sh | sudo DENO_INSTALL=/usr/local sh

# install yarn
echo $'\n########\ninstall yarn\n'

curl -o- -L https://yarnpkg.com/install.sh | bash
echo "export PATH=\"$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH\"" >> ~/.dotfiles/.bash_profile

# install midnight commander
echo $'\n########\ninstall midnight commander\n'

sudo apt-get install -y mc

# make .bash_profile persistent

echo "source ~/.dotfiles/.bash_profile" >> ~/.bashrc

# load .bash_profile
echo $'\n########\nload .bash_profile\n'

source ~/.dotfiles/.bash_profile

# configure git credential manager
echo $'\n########\nconfigure git credential manager\n'

git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"

# done
echo $'\n########\ndone\n'
