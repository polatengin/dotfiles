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

function server() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
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
