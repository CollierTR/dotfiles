# Cheatsheet system — usage: cheat <topic>

cheat() {
  case "$1" in
    commit | git) _cheat_commit ;;
    tw | task) _cheat_tw ;;
    *) _cheat_usage ;;
  esac
}

_cheat_usage() {
  cat <<'EOF'
Usage: cheat <topic>

Topics:
  commit, git    Conventional commit cheat sheet
  tw, task       Taskwarrior cheat sheet
EOF
}

_cheat_commit() {
  cat <<'EOF'

========================================
      Conventional Commit Cheat Sheet
========================================

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

_cheat_tw() {
  cat <<'EOF'

========================================
      Taskwarrior Cheat Sheet
========================================

Formula:
  task <filters> <command>

-----------------------------------------
Adding Tasks
-----------------------------------------

  task add "Buy groceries"
  task add project:home "Fix leaky faucet"
  task add due:tomorrow "Pay rent"
  task add pri:H "Call dentist"
  task add project:work +urgent "Deploy hotfix"
  task add "Write report" due:friday project:work pri:M

  Priorities:  H (high)  M (medium)  L (low)
  Tags:        prepended with + (e.g. +urgent +phone)

-----------------------------------------
Listing Tasks
-----------------------------------------

  task list                  All pending tasks
  task active                All active (started) tasks
  task completed             All completed tasks
  task all                   Everything (pending + completed)

  task ls                    Short listing (single line)
  task summary               Compact project summary

  task next                  Recommended next tasks (default)
  task newest                Sorted by entry date
  task oldest                Sorted by entry date (oldest first)
  task largest               Sorted by urgency score

  task upcoming              Tasks with due dates, sorted

-----------------------------------------
Filtering
-----------------------------------------

  task project:home list                 Filter by project
  task +phone list                       Filter by tag
  task pri:H list                        Filter by priority
  task due.before:today list             Due before today
  task due:today list                    Due today
  task due:tomorrow list                 Due tomorrow
  task due:monday list                   Due on a specific day
  task status:pending list               By status
  task description.contains:email list   Search in description
  task -urgent list                      Exclude a tag
  task project:home +phone pri:H list    Combine filters

  Note: "list" can be replaced with "count" to just get a number.

-----------------------------------------
Modifying Tasks
-----------------------------------------

  task 1 modify project:work         Move to project
  task 1 modify due:friday           Set due date
  task 1 modify due:                 Clear due date
  task 1 modify pri:H                Set priority
  task 1 modify pri:                 Clear priority
  task 1 modify +urgent              Add a tag
  task 1 modify -urgent              Remove a tag
  task 1 modify "New description"    Change description
  task 1 modify project:             Remove from project

  task 1 done                        Complete a task
  task 1 delete                      Delete a task
  task 1 start                       Start a task (time tracking)
  task 1 stop                        Stop a task

  task 1 modify wait:2025-01-15      Hide until a date
  task 1 modify wait:                 Clear wait date

-----------------------------------------
Annotations
-----------------------------------------

  task 1 annotate "Called and left voicemail"
  task 1 annotate "Follow up next week"

  task 1 info                        Show full task details

-----------------------------------------
Undo
-----------------------------------------

  task undo                          Undo last action

-----------------------------------------
Due Dates with Time
-----------------------------------------

  ISO-8601 (date + time):
    task add "Deploy" due:2025-07-21T14:30:00
    task add "Deploy" due:2025-07-21T09:00:00

  Relative time arithmetic:
    task add "Call mom" due:today+2h
    task add "Fix bug" due:today+45m
    task add "Standup" due:tomorrow+9h
    task add "Review PR" due:eod-1h

  Preview dates before committing:
    task calc today+2h
    task calc tomorrow+9h
    task calc eod-30m

  Note: without time, due defaults to 00:00:00.

-----------------------------------------
Date Synonyms (Time-Aware)
-----------------------------------------

  now      Current date + time
  today    Start of day (00:00:00)
  sod      Same as today
  eod      End of day (23:59:59)
  tomorrow Tomorrow at 00:00:00
  eom      End of month (23:59:59)
  eow      End of week (23:59:59)
  eoy      End of year (23:59:59)
  soy      Start of year (00:00:00)
  som      Start of month (00:00:00)
  sow      Start of week (00:00:00)
  weekday names: mon, tue, wed, thu, fri, sat, sun

  All synonyms support modifiers:
    sonw = start of next week
    sopw = start of previous week
    eonw = end of next week

  Use task calc to preview:
    task calc eod
    task calc sonw

-----------------------------------------
Scheduled & Wait (Timeblocking)
-----------------------------------------

  scheduled — task becomes available at a date, shown in "task ready":
    task add "Write report" scheduled:today+1h due:today+3h
    task add "Deploy" scheduled:friday due:friday+2h

  wait — task is hidden until a date, not shown in most reports:
    task add "Wait for review" wait:2025-07-25
    task add "Someday maybe" wait:later
    task add "Someday maybe" wait:someday

  Clear wait/scheduled:
    task 1 modify wait:
    task 1 modify scheduled:

  Key difference:
    scheduled = visible in "task ready" after the date
    wait      = hidden from most reports until the date

-----------------------------------------
Time Tracking (Start/Stop)
-----------------------------------------

  task 1 start                     Mark task as started
  task 1 stop                      Clear start time
  task active                      Show all in-progress tasks

  Use for timeblocking:
    Start a task when its block begins, stop when it ends.
    Pair with Timewarrior for precise tracking (see below).

-----------------------------------------
Duration (Workarounds)
-----------------------------------------

  Taskwarrior has no built-in duration attribute. Workarounds:

  1. Due date math (approximate timebox):
     task add "Write intro" due:today+2h
     This implies a 2-hour window from now.

  2. Scheduled + Due (explicit timebox):
     task add "Deep work" scheduled:today+1h due:today+3h
     The 2-hour gap between scheduled and due is your block.

  3. Annotations (manual notes):
     task 1 annotate "Spent ~45m on this"

  4. Timewarrior (precise tracking — see below).

-----------------------------------------
Timewarrior (Companion Tool)
-----------------------------------------

  Timewarrior tracks exact time spent on tasks. Install separately.

  timew start @1                   Start tracking task 1
  timew stop                       Stop tracking
  timew                             Show active timer
  timew summary                    Show today's time summary

  Link to a tag:
    timew start +writing @1
    timew tag @1 deepwork

  Useful for reviewing how long tasks actually take.

-----------------------------------------
Recurring Tasks
-----------------------------------------

  Frequencies:
    daily, day, 1da, 2da       Every N days
    weekdays                   Mon-Fri only
    weekly, 1wk, 2wks          Every N weeks
    biweekly, fortnight        Every 2 weeks
    monthly, 1mo, 2mo          Every N months
    quarterly, 1qtr            Every 3 months
    yearly, annual, 1yr        Every N years

  Examples:
    task add "Take medicine" due:today+8h recur:daily
    task add "Team standup" due:9am recur:weekdays
    task add "Pay rent" due:1st recur:monthly
    task add "Review goals" due:som recur:quarterly

  Stop a recurring task (snooze):
    task 1 modify due:+1wk

  Delete all future instances:
    task 1 delete

-----------------------------------------
Common Examples
-----------------------------------------

Add a task for tomorrow:
  task add "Renew insurance" due:tomorrow

Quick capture to inbox (no project):
  task add "Look into that thing"

High priority work task with tag:
  task add project:work pri:H +client "Fix billing bug"

See everything due this week:
  task due.before:saturday list

Complete multiple tasks:
  task 1 2 3 done

Filter by multiple tags:
  task +phone +urgent list

Show tasks with no project:
  task project: list

Report by project:
  task project:home summary

Search tasks:
  task description.contains:"insurance" list

Timeblocking — deep work block:
  task add "Write proposal" scheduled:today+1h due:today+3h

Morning routine (recurring at specific time):
  task add "Standup" due:today+9h recur:weekdays

Hide a task until next week:
  task 1 modify wait:sonw

Preview a date:
  task calc tomorrow+3hrs
  task calc eod-30m

Track time on a task:
  timew start +coding @1
  timew stop

-----------------------------------------
Useful Aliases (add to .bashrc)
-----------------------------------------

  alias tl='task list'
  alias ta='task add'
  alias td='task done'
  alias ts='task summary'

EOF
}

alias commit-help='cheat commit'
