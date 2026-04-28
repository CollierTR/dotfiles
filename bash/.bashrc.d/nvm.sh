load_nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    nvm use
  fi
}

# Run when directory changes
PROMPT_COMMAND="load_nvmrc;$PROMPT_COMMAND"
