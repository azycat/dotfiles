# autocomplete plugin
source $ZDOTDIR/plugins/autocomplete/autocomplete.zsh

# default apps
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="qutebrowser"

# history in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$ZDOTDIR/.zsh_history

# aliases
[ -f "${ZDOTDIR}/.zsh_aliases" ] && source "${ZDOTDIR}/.zsh_aliases"
export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'

# options
# unsetopt flowcontrol

# bindkey '^a' beginning-of-line
# bindkey '^e' end-of-line
# bindkey "^P" up-line-or-search

bindkey -e

bindkey ' ' magic-space
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

# application paths
export PATH="$HOME/.local/bin:$PATH"
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
source "${XDG_CONFIG_HOME}/lf/lfcd.sh"
source "/usr/share/LS_COLORS/dircolors.sh"
export CITY="~/53chan/struppi-city"

# theme
setopt PROMPT_SUBST
source $ZDOTDIR/git.zsh
source $ZDOTDIR/themes/nanotech.zsh-theme
zstyle ':completion:*' matcher-list 'm:{lower:]}={[:upper:]}'
zstyle :compinstall filename '${ZDOTDIR}/.zshrc'
# compinit
# make sure to re-enable compinit if not using zsh-autocomplete

zstyle ':completion:*' menu select

# lf autocompletion
fpath=($ZDOTDIR/plugins/_lf $fpath)

# source plugins
source "${ZDOTDIR}/.zsh_plugins"
