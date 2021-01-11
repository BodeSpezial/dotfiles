starship init fish | source
thefuck --alias duck | source

# add bins grom `go get`
set PATH $HOME/go/bin/ $PATH

# bat to color manpages
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# use vim as editor in ttrv
set -x TTRV_EDITOR "vim"

set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths
set -g fish_user_paths "/Users/konstatin/.local/bin" $fish_user_paths

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /Users/konstatin/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/konstatin/.ghcup/bin $PATH
