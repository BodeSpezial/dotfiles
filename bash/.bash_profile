parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[1;34m\]\h \[\033[01;33m\]\w\[\033[0;36m\]\$(parse_git_branch)\[\033[01;35m\] \$\[\033[0m\]"
##colorize ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#####alias source files
###modan and current aliases 
source ./.bash_project_aliases
#
###aliases for costumer server
source ./.bash_server_aliases
#
###base aliases
source ./.bash_aliases

export EDITOR=/usr/bin/vim
export BLOCKSIZE=1k
alias phpcs="/Users/jb/.composer/vendor/bin/phpcs --standard=vendor/zifius/magizendo/Magento1/ruleset.xml "
export PATH="/usr/local/sbin:$PATH:~/Development/flutter/bin:~/Desktop/"
##start slicing software
alias 3dd="DYLD_INSERT_LIBRARIES=/Applications/Simplify3D-4.0.1/Interface.dylib DYLD_FORCE_FLAT_NAMESPACE=1 /Applications/Simplify3D-4.0.1/Simplify3D.app/Contents/MacOS/Simplify3D"
##load bashrc
source ./.bashrc
