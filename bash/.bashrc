eval "$(thefuck --alias)"
eval "$(gh completion)"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

PATH="/Users/konstatin/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/konstatin/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/konstatin/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/konstatin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/konstatin/perl5"; export PERL_MM_OPT;

###base aliases
source ~/.bash_aliases

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[1;34m\]\h \[\033[01;33m\]\w\[\033[0;36m\]\$(parse_git_branch)\n\[\033[01;35m\] ☞\[\033[0m\]"

##colorize ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export EDITOR=/usr/bin/vim
export BLOCKSIZE=1k
export PATH="/usr/local/sbin:$PATH:~/Development/flutter/bin:~/Desktop/:/usr/local/go/bin"

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
