parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[1;34m\]\h \[\033[01;33m\]\w\[\033[0;36m\]\$(parse_git_branch)\n\[\033[01;35m\] ☞\[\033[0m\]"

##colorize ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

###base aliases
source ~/.bash_aliases

export EDITOR=/usr/bin/vim
export BLOCKSIZE=1k
export PATH="/usr/local/sbin:$PATH:~/Development/flutter/bin:~/Desktop/:/usr/local/go/bin"

##load bashrc
source ~/.bashrc
