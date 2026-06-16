# A home for functions

ai() {
  local prompt="$*"

  echo " "
  echo "Thinking..."

  local output
  output=$(opencode run --format json "$prompt")

  clear

  echo "$output" \
    | grep '^{' \
    | jq -r 'select(.type=="text") | .part.text' \

  echo "$output" \
    | grep '^{' \
    | jq -r 'select(.type=="text") | .part.text' \
    | speak
}
