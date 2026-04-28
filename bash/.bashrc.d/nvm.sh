load_nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ "$nvmrc_path" != "$NVMRC_PATH" ]; then
    NVMRC_PATH="$nvmrc_path"

    if [ -n "$nvmrc_path" ]; then
      nvm use
    else
      nvm use default
    fi
  fi
}

# Run when directory changes
if [[ "$PROMPT_COMMAND" != *load_nvmrc* ]]; then
  PROMPT_COMMAND="load_nvmrc;${PROMPT_COMMAND}"
fi
