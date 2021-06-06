starship init fish | source
thefuck --alias duck | source

# bat to color manpages
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# use nvim as editor in ttrv
set -x TTRV_EDITOR "nvim"

# adding variables to path
set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths
set -g fish_user_paths "/Users/konstatin/.local/bin" $fish_user_paths

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /Users/konstatin/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/konstatin/.ghcup/bin $PATH

# make the preview of `cd` colored and sorted
set -gx FZF_PREVIEW_DIR_CMD "exa --color=always -s extension"
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --no-ignore-vcs -g '!{node_modules,.git}'"

