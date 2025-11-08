#
# history: Set better history values
#

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
[[ -d ${HISTFILE:h} ]] || mkdir -p ${HISTFILE:h}
