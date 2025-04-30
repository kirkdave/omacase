[[ -z "$XDG_CACHE_HOME" ]] && export XDG_CACHE_HOME=$HOME/.cache
[[ -z "$XDG_CONFIG_HOME" ]] && export XDG_CONFIG_HOME=$HOME/.config
[[ -z "$XDG_DATA_HOME" ]] && export XDG_DATA_HOME=$HOME/.local/share

[[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"

ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"

[[ -f "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

if [ ! -d "${ZINIT_HOME}" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions


zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo

autoload -Uz compinit && compinit

eval "$(fzf --zsh)"
# eval "$(zoxide init zsh)"
# eval "$(mise activate zsh)"

[[ -f $HOME/.p10k.zsh ]] && source $HOME/.p10k.zsh

##
# Alias
##
alias c="clear"

alias ls="eza -lg --group-directories-first --icons=always"
alias ll="ls"
alias la="ls -a"
alias lt="eza --tree --level-3 --icons --git"
alias lta="lt -a"

##
# Load Functions
##
OMACASE_FUNCTIONS_DIR=$HOME/.zsh-functions
typeset -U fpath
if [[ -z ${fpath[(r)$OMACASE_FUNCTIONS_DIR]} ]]; then
	fpath=($OMACASE_FUNCTIONS_DIR $fpath)
	autoload -Uz ${OMACASE_FUNCTIONS_DIR}/*(:t)
fi
