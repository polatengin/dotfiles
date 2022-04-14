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


function az_bicep_help() {
  # get output of `az bicep --help` command
  local output=$(command az bicep --help)

  # command description that will added to `--help` text
  local _command_usage="Commands:\n    generate      : Generate bicep file from the existing Resource Group."

  # replace `Commands:` with `Commands:` and command description
  echo -e "${output/Commands:/${_command_usage}}"
}

function g() {
  local CD="${1:-$PWD}";

  cd "$CD"

  for d in */ ; do
    cd "$d"

    if [ ! -d .git ]; then
      cd "$CD"

      continue
    fi

    if [[ -z $(git status -s) ]]
    then
      cd "$CD"

      continue
    else
      echo "$d is dirty!"

      cd "$CD"
    fi
  done
}

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
