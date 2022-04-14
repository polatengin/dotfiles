function _get_extension_info_json() {
echo $(cat <<EOF
[
{
  "SUB_COMMAND_NAME": "repo",
  "ARGUMENT_NAME": "--help",
  "METHOD_NAME": "repo_help"
},
{
  "SUB_COMMAND_NAME": "repo",
  "ARGUMENT_NAME": "generate",
  "METHOD_NAME": "repo_generate"
}
]
EOF
)
}

