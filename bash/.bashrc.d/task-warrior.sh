# _tw_filter() { grep -v 'Configuration override'; }
#
# tw-dashboard() {
#   local cols="rc.report.list.columns=id,project,due.relative,description,urgency"
#   local labels="rc.report.list.labels=ID,Project,Due,Description,Urg"
#   local quiet="rc.summary=no"
#   local verbose="rc.verbose=no"
#
#   printf "\033[1;31m=== OVERDUE ===\033[0m\n"
#   task list due.before:now $cols $labels $quiet $verbose
#
#   printf "\n\033[1;32m=== DUE TODAY ===\033[0m\n"
#
#   task list due:today $cols $labels $quiet $verbose
#
#   printf "\n\033[1;36m=== HABITS ===\033[0m\n"
#   task list +habit \( due:today or due.before:today \) $cols $labels $quiet $verbose rc.report.list.sort=due+
#
#   printf "\n\033[1;33m=== HIGH URGENCY ===\033[0m\n"
#
#   task list limit:5 rc.report.list.sort=urgency- $cols $labels $quiet $verbose
# }
#
# tom() {
#   local tw_opts="rc.report.list.columns=id,project,due.relative,description,urgency rc.report.list.labels=ID,Project,Due,Description,Urg rc.summary=no rc.verbose=no rc.color=always"
#
#   echo -e "\e[1;35m=== DUE TOMORROW ===\e[0m"
#   task list due:tomorrow $tw_opts
#
#   # echo -e "\n\e[1;33m=== UPCOMING (NEXT 7 DAYS) ===\e[0m"
#   # task list due.after:tomorrow due.before:today+7days limit:10 $tw_opts rc.report.list.sort=due+
#
# }
#
# agenda() {
#   local red
#   local yellow
#
#   red=$(gcalcli --calendar "Calendar" agenda now "+20 minutes" |
#     sed '/^$/d')
#
#   yellow=$(gcalcli --calendar "Calendar" agenda now "+8 hours" |
#     sed '/^$/d')
#
#   # echo -e "\e[31m${red}\e[0m"
#   echo -e "\e[33m${yellow}\e[0m"
# }
#
#
# taskwatch() {
#   while true; do
#     screen=$(
#       agenda
#
#       echo
#       tw-dashboard
#     )
#
#     clear
#     printf "%s\n" "$screen"
#
#     sleep 30
#
#   done
# }

_tw_filter() { grep -v 'Configuration override'; }

tw-dashboard() {
  local cols="rc.report.list.columns=id,project,due.relative,description,urgency"
  local labels="rc.report.list.labels=ID,Project,Due,Description,Urg"
  local quiet="rc.summary=no"
  local verbose="rc.verbose=no"

  printf "\033[1;31m=== OVERDUE ===\033[0m\n"
  task list due.before:now $cols $labels $quiet $verbose

  printf "\n\033[1;32m=== DUE TODAY ===\033[0m\n"
  task '(+ACTIVE) or ((scheduled.before:now) or (due:today))' \
    -habit $cols $labels $quiet $verbose

  printf "\n\033[1;36m=== HABITS ===\033[0m\n"
  task list +habit \( due:today or due.before:today \) $cols $labels $quiet $verbose rc.report.list.sort=due+

  # printf "\n\033[1;33m=== HIGH URGENCY ===\033[0m\n"
  # task list limit:5 rc.report.list.sort=urgency- $cols $labels $quiet $verbose
}

tom() {
  local tw_opts="rc.report.list.columns=id,project,due.relative,description,urgency rc.report.list.labels=ID,Project,Due,Description,Urg rc.summary=no rc.verbose=no"

  printf "\033[1;35m=== DUE TOMORROW ===\033[0m\n"

  task list due:tomorrow $tw_opts
}

agenda() {
  gcalcli --calendar "Calendar" agenda now "+8 hours" |
    sed '/^$/d'
}

taskwatch() {
  local calendar=""

  while true; do
    # Pre-render the slow part

    calendar=$(
      agenda
    )

    clear

    # Print cached calendar
    printf "\033[1;33m%s\033[0m\n" "$calendar"

    echo

    # Let Taskwarrior talk directly to the terminal
    tw-dashboard

    sleep 30
  done
}
