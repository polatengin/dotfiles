#!/usr/bin/env bash

function c() {
  local CD="${1:-$PWD}";

  local _executable=`command -v code-insiders`

  if [[ -z $_executable ]]
  then
    code "$CD"
  else
    code-insiders "$CD"
  fi
}

source ~/.dotfiles/_helpers.sh

function az_bicep_help() {
  # get output of `az bicep --help` command
  local output=$(command az bicep --help)

  # command description that will added to `--help` text
  local _command_usage="Commands:\n    generate      : Generate bicep file from the existing Resource Group."

  # replace `Commands:` with `Commands:` and command description
  echo -e "${output/Commands:/${_command_usage}}"
}

function az_bicep_generate() {
  # check only for the arguments that we want to extend
  if [[ ${1} == "bicep" && ${2} == "generate" ]]; then

    # if required arguments are present, execute the command
    if [[ ${3} == "--resource-group" || ${3} == "-n" ]]; then

      # default filename is the resource group name
      local FILE_NAME="${4}"

      # if the filename is not provided, use the given name
      if [[ ${5} == "--output-file" || ${5} == "-f" ]]; then
        FILE_NAME="${6}"
      fi

      # if extension is not provided, use the `.bicep` extension
      if [[ ${FILE_NAME} != *".bicep" ]]; then
        FILE_NAME="${FILE_NAME}.bicep"
      fi

      # export the resource group to the temp file
      az group export --name "${4}" > "/tmp/${4}.json"

      # generate the bicep file from the temp file
      az bicep decompile --file "/tmp/${4}.json"

      # remove the temp file
      rm -f "/tmp/${4}.json"

      # move the bicep file to the desired location
      mv "/tmp/${4}.bicep" "./${FILE_NAME}"
    # if required arguments are not present, print the usage message
    else
      echo "Usage: az bicep generate --resource-group <resource-group-name> [--output-file <file-name>]";
    fi

    # return from the function
    return 0
  fi
}

add_extension \
  --command-name "az" \
  --sub-command-name "bicep" \
  --argument-name "--help" \
  --run "az_bicep_help"

add_extension \
  --command-name "az" \
  --sub-command-name "bicep" \
  --argument-name "generate" \
  --run "az_bicep_generate"
