# If not running interactively, don't do anything
[ -z "$PS1" ] && return

KCBC_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# ******************************************************************************
# * Options                                                                    *
# ******************************************************************************
if [ -f "/usr/share/bash-completion/bash_completion" ]; then
	source "/usr/share/bash-completion/bash_completion"
fi
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -u direxpand      # $HOME/.config  - TAB   ->  /home/user/.config
shopt -u progcomp       # $HOME/.config  - TAB   ->  \$HOME/.config
shopt -u autocd         # DIR            - ENTER ->  cd -- dir/
shopt -u dotglob        # *                      ->  .*
shopt -u cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases

# autocomplete with one tab instead of two
bind "set show-all-if-ambiguous on"
# ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"
bind "set bell-style none"
# bind 'TAB:menu-complete'
# # pressing tab will automatically complete the first item
# bind '"\C-i" menu-complete'

# ******************************************************************************
# * Envs                                                                       *
# ******************************************************************************
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

export HISTCONTROL=ignoreboth:erasedups

# Go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
if [ -d "$HOME/.bin" ]; then
	PATH="$HOME/.bin:$PATH"
fi

# NPM
# export NODE_OPTIONS=--openssl-legacy-provider

source "${KCBC_DIR}/aliases/aliases.bash"

source "${KCBC_DIR}/modules/fzf.bash"
source "${KCBC_DIR}/modules/zoxide.bash"