# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

function md () {
	mkdir -p $1; cd $1;
}

function extract_from_container {
  docker create -ti --name dummy $1 bash
  docker cp dummy:$2 $3
  docker rm -f dummy
}

alias 'ls'='ls --color=auto'
alias 'l'='ls'
alias 'll'='ls -l'
alias 'la'='ls -a'
alias 'lla'='ls -al'

alias 'm'='make'

parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h:\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# find pip installed stuff with --user
export PATH=${HOME}/.local/bin:${PATH}

# go settings
export GOROOT=${HOME}/go
export GOPATH=${HOME}/go/bin
export PATH=${HOME}/go/bin/:${PATH}

eval "$(thefuck --alias)"

