#!/usr/bin/env bash

alias ll="ls -lah"

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

alias speedtest="wget -O /dev/null http://speed.transip.nl/100mb.bin"

alias k="kubectl"

alias kcd="kubectl config use-context docker-desktop"

alias d="docker $*"

alias go="docker run --rm -it -v $(pwd):/p -w /p golang:1.18-buster go"

alias dotnet="docker run --rm -it -v $(pwd):/p -w /p mcr.microsoft.com/dotnet/sdk:7.0 dotnet"

alias markdownlint="docker run --rm -it -v $(pwd):/p -w /p ghcr.io/igorshubovych/markdownlint-cli:latest"
