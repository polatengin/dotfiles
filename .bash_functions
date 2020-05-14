#!/usr/bin/env bash

function mkd() {
  mkdir -p "$@" && cd "$_";
}

function server() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}
