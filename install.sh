#!/usr/bin/env bash

# stop on error
# set -e

if [ ! -z "${1}" ]
then
  git config --global user.name "${1}"
fi

if [ ! -z "${2}" ]
then
  git config --global user.email "${2}"
fi

if [ ! -z "${3}" ]
then
  git config --global user.signingkey "${3}"
  git config --global commit.gpgsign true
fi

# clone dotfiles repo
echo $'\n########\nclone dotfiles repo\n'

sudo rm -rf ~/.dotfiles

git clone https://github.com/polatengin/dotfiles.git ~/.dotfiles

# create projects folder
echo $'\n########\ncreate projects folder\n'

sudo mkdir -p ~/p

# update and upgrade current packages
echo $'\n########\nupdate and upgrade current packages\n'

sudo apt-get update
sudo apt-get -y upgrade

# install global dependencies
echo $'\n########\ninstall global dependencies\n'

sudo apt install -y nano htop unzip

# install jq and yq
echo $'\n########\ninstall jq and yq\n'

sudo apt install -y jq

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CC86BB64
sudo add-apt-repository ppa:rmescandon/yq
sudo apt update
sudo apt install yq -y

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

# install terraform
echo $'\n########\ninstall terraform\n'

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform

# install kubeval
echo $'\n########\ninstall kubeval\n'

cd /tmp
wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
tar xf kubeval-linux-amd64.tar.gz
sudo cp kubeval /usr/local/bin

# install node
echo $'\n########\ninstall node\n'

sudo apt install -y nodejs

# install npm
echo $'\n########\ninstall npm\n'

sudo apt install -y npm

# install ncu
echo $'\n########\ninstall ncu\n'

sudo npm install -g npm-check-updates

# install midnight commander
echo $'\n########\ninstall midnight commander\n'

sudo apt-get install -y mc

# install github cli

echo $'\n########\ninstall github cli\n'

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# make .bash_profile persistent

echo "source ~/.dotfiles/.bash_profile" >> ~/.bashrc

# done
echo $'\n########\ndone\n'
