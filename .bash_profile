#!/usr/bin/env bash

export GPG_TTY=$(tty)

export HISTCONTROL=erasedups

source ~/.dotfiles/.bash_aliases

source ~/.dotfiles/_helpers.sh

source ~/.dotfiles/.bash_functions

setup_extensions

source ~/.dotfiles/.bash_prompt
