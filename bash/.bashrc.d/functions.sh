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

commit-help() {
  cat <<'EOF'

=========================================
      Conventional Commit Cheat Sheet
=========================================

Formula:
  <type>(<scope>): <summary>

Examples:
  feat(auth): add MSAL client
  fix(email): handle empty recipient list
  refactor(logging): convert logger to singleton
  test(ui): add Table component tests
  ci(azure): update deployment workflow
  build(tsconfig): target ES2018 output

-----------------------------------------
Types
-----------------------------------------

  feat      New functionality
  fix       Bug fix
  refactor  Code restructure (no behavior change)
  test      Tests only
  ci        CI/CD changes
  build     Build/config changes
  chore     Maintenance, setup, dependencies

-----------------------------------------
Common Scopes
-----------------------------------------

  auth
  email
  ui
  logging
  config
  azure
  trigger
  css
  table
  weather
  card
  title
  footer
  deps
  github
  tsconfig

-----------------------------------------
Good Verbs
-----------------------------------------

  add
  update
  remove
  refactor
  simplify
  configure
  implement
  support
  enable
  disable
  improve
  optimize
  validate
  handle
  prevent
  convert

-----------------------------------------
Quick Guide
-----------------------------------------

Added functionality?
  feat(scope): add thing

Fixed a bug?
  fix(scope): handle thing

Changed architecture?
  refactor(scope): simplify thing

Added tests?
  test(scope): add thing tests

Changed GitHub Actions / Azure pipeline?
  ci(scope): configure thing

Changed tsconfig / build settings?
  build(scope): update thing

Installed packages / project setup?
  chore(scope): add thing

-----------------------------------------
Examples
-----------------------------------------

  feat(email): add Email builder class
  feat(ui): add Weather component
  test(email): add send integration test
  refactor(logging): convert logger to singleton
  ci(azure): add deployment workflow
  build(tsconfig): target ES2018 output
  chore(deps): add Vitest

EOF
}
