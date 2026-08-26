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

issues() {
  if [[ "$1" == "-m" ]]; then
    gh search issues --assignee @me --state open
  else
    gh search issues --owner @me --state open
  fi
}

work-issues() {
  if [[ "$1" == "-m" ]]; then
    az boards query --wiql "SELECT [System.Id], [System.Title], [System.State], [System.WorkItemType] FROM WorkItems WHERE [System.State] <> 'Done' AND [System.AssignedTo] = @me ORDER BY [System.Id]" -o table
    gh search issues --owner Bonnie-Plants-LLC --state open --assignee @me
  else
    az boards query --wiql "SELECT [System.Id], [System.Title], [System.State], [System.WorkItemType], [System.Tags] FROM WorkItems WHERE [System.State] <> 'Done' ORDER BY [System.Id]" -o table
    gh search issues --owner Bonnie-Plants-LLC --state open
  fi
}
