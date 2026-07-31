# A home for functions

ai() {
  local prompt="$*"

  echo " "
  echo "Thinking..."

  local output
  output=$(opencode run --format json "$prompt")

  clear

  echo "$output" |
    grep '^{' |
    jq -r 'select(.type=="text") | .part.text'

  echo "$output" |
    grep '^{' |
    jq -r 'select(.type=="text") | .part.text' |
    speak
}

timer() {
  if [[ -z "$1" ]]; then

    echo "Usage: timer <minutes>"
    return 1
  fi

  local seconds=$(($1 * 60))

  echo "Timer started for $1 minute(s)..."

  sleep "$seconds"

  powershell.exe -c "[console]::beep(1000,500)"

  echo "Timer finished!"

  powershell.exe -c "[console]::beep(1000,500)"
}
