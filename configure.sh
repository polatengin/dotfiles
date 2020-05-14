#!/usr/bin/env bash

cd ~/

mkdir .dotfiles

git clone https://github.com/polatengin/dotfiles.git

echo ". ~/.dotfiles/.bash_aliases" >> ~/.bash_profile
echo ". ~/.dotfiles/.bash_functions" >> ~/.bash_profile
echo ". ~/.dotfiles/.bash_profile" >> ~/.bash_profile
echo ". ~/.dotfiles/.bash_prompt" >> ~/.bash_profile

source ~/.bash_profile

