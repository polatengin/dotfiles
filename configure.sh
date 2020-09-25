#!/usr/bin/env bash

# stop on error
# set -e

# collect name and email and save it as git config, globally
NAME=$1
EMAIL=$2

if [ -z "$NAME" ]
then
  read -p "Please enter your git user.name, (for example, polatengin)" NAME
  NAME=${NAME:-"polatengin"}
fi

if [ -z "$EMAIL" ]
then
  read -p "Please enter your git user.email, (for example, polatengin[at]outlook[dot]com)" EMAIL
  EMAIL=${EMAIL:-"polatengin@outlook.com"}
fi

git config --global user.name $NAME
git config --global user.email $EMAIL

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

sudo apt install -y nano htop jq unzip python3-setuptools

# install pip3
echo $'\n########\ninstall pip3\n'

sudo apt install -y python3-pip

# install go
echo $'\n########\ninstall go\n'

sudo apt install -y golang

# install ruby
echo $'\n########\ninstall ruby\n'

sudo apt install -y ruby-dev

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

# install terraform
echo $'\n########\ninstall terraform\n'

cd /tmp
wget https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip
unzip terraform_0.13.4_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# install jmespath.terminal
echo $'\n########\ninstall jmespath.terminal\n'

pip3 install jmespath-terminal

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

# install deno
echo $'\n########\ninstall deno\n'

curl -fsSL https://deno.land/x/install/install.sh | sudo DENO_INSTALL=/usr/local sh

# install yarn
echo $'\n########\ninstall yarn\n'

curl -o- -L https://yarnpkg.com/install.sh | bash
echo "export PATH=\"$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH\"" >> ~/.dotfiles/.bash_profile

# install ncu
echo $'\n########\ninstall ncu\n'

npm install -g npm-check-updates

# install locust
echo $'\n########\ninstall locust\n'

pip3 install locust

# install k6
echo $'\n########\ninstall k6\n'

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
echo "deb https://dl.bintray.com/loadimpact/deb stable main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install k6

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
