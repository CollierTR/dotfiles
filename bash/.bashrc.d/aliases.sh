# A home for aliases


alias clock='tty-clock -cSt'

# View the calender by typing the first three letters of the month.
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'

# Shortcut to my window's dev folder
alias windev='cd /mnt/c/Users/TristanCollier/Documents/Dev\ Projects/'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if ! command -v bat >/dev/null 2>&1 && command -v batcat >/dev/null 2>&1; then
  alias bat='batcat'
fi

alias anime='anipy-cli -p vlc'

# some more ls aliases
alias ls='lsd --group-dirs first'
alias l='ls --group-dirs first -1'
alias ll='lsd -alF'
alias la='ls -A'
alias fetch='clear && fastfetch --logo none'

# View the Git log.
alias gl='git --no-pager log --oneline --graph --all'

# Clear the Terminal
alias cls='clear'

# Notebook alias
alias todo='rg -F -- "- [ ]"'
alias hannah='rg -F -- "@hannah" ~/notebook'
alias reset-hannah='rg -l "@hannah" ~/notebook --type md -0 | xargs -0 sed -i "/@hannah/d"'
alias prayer='rg -F -- "@prayer" ~/notebook'
alias reset-prayer='rg -l "@prayer" ~/notebook --type md -0 | xargs -0 sed -i "/@prayer/d"'
