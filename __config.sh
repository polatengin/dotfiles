### utilities

sudo apt update
sudo apt upgrade -y
sudo apt install curl wget git build-essential zsh jq make unzip -y

### github cli
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

### azure cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

### dotnet 8
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update && sudo apt install -y dotnet-sdk-8.0 aspnetcore-runtime-8.0 dotnet-runtime-8.0

### nodejs 21
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 21

### teams cli
sudo npm install -g @microsoft/teamsapp-cli

### rust
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

### powershell 7
source /etc/os-release
wget -q https://packages.microsoft.com/config/debian/$VERSION_ID/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update
sudo apt install -y powershell

# ### docker
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt update -y
# apt-cache policy docker-ce
# sudo apt install docker-ce -y

# ### terraform
# sudo apt update && sudo apt install -y gnupg software-properties-common
# wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# sudo apt update
# sudo apt install terraform -y

## devcontainers/cli
sudo npm install -g @devcontainers/cli

### git config
git config --global user.name "polatengin"
git config --global user.email "enpolat@microsoft.com"
git config --global user.signingkey "8764D8CBA74A14D7"
git config --global commit.gpgsign true
echo "" >> ~/.zshrc
echo "alias gp=\"git fetch -p ; git branch -r | awk '{print \$1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print \$1}' | xargs git branch --force -d\"" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "export GPG_TTY=$(tty)" >> ~/.zshrc
echo "default-cache-ttl 28800" >> ~/.gnupg/gpg-agent.conf
gpg --import gpg-private.key
eval `ssh-agent -s`
ssh-add
