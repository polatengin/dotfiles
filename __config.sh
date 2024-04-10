touch /etc/wsl.conf
echo "[user]" > /etc/wsl.conf
echo "default=enpolat" > /etc/wsl.conf

cd /tmp

### utilities

sudo apt update
sudo apt upgrade -y
sudo apt install curl wget git build-essential zsh jq make unzip ca-certificates gnupg software-properties-common -y

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install 21

### teams cli
sudo npm install -g @microsoft/teamsapp-cli

### rust
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "source \"\$HOME/.cargo/env\"" >> ~/.zshrc

### powershell 7
# source /etc/os-release
# wget -q https://packages.microsoft.com/config/debian/$VERSION_ID/packages-microsoft-prod.deb
# sudo dpkg -i packages-microsoft-prod.deb
# rm packages-microsoft-prod.deb
# sudo apt update
# sudo apt install -y powershell

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
git config --global commit.gpgsign true
echo "" >> ~/.zshrc
echo "alias gp=\"git fetch -p ; git branch -r | awk '{print \$1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print \$1}' | xargs git branch --force -d\"" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "export GPG_TTY=$(tty)" >> ~/.zshrc

# gpg --import gpg-private.key
# eval `ssh-agent -s`
# ssh-add

code-insiders --install-extension GitHub.copilot
code-insiders --install-extension ms-python.python
code-insiders --install-extension ms-dotnettools.vscode-dotnet-runtime
code-insiders --install-extension ms-vscode.azure-account
code-insiders --install-extension ms-vscode.azurecli
code-insiders --install-extension ms-azuretools.vscode-azureresourcegroups
code-insiders --install-extension ms-azuretools.vscode-azureterraform
code-insiders --install-extension ms-vscode.vscode-node-azure-pack
code-insiders --install-extension ms-azuretools.vscode-azurevirtualmachines
code-insiders --install-extension ms-azuretools.vscode-bicep
code-insiders --install-extension ms-vscode.cpptools-extension-pack
code-insiders --install-extension ms-dotnettools.csharp
code-insiders --install-extension ms-dotnettools.csdevkit
code-insiders --install-extension ms-azuretools.vscode-docker
code-insiders --install-extension EditorConfig.EditorConfig
code-insiders --install-extension dbaeumer.vscode-eslint
code-insiders --install-extension GitHub.copilot-chat
code-insiders --install-extension GitHub.vscode-pull-request-github
code-insiders --install-extension ms-dotnettools.vscodeintellicode-csharp
code-insiders --install-extension ms-vscode.makefile-tools
code-insiders --install-extension DavidAnson.vscode-markdownlint
