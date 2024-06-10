# initialize plugins and completions
plugins=(bgnotify common-aliases cp last-working-dir vim-ctrl-z)
source $ZDOTDIR/init.zsh

# default apps
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="qutebrowser"

export PATH="$HOME/.local/bin:$PATH"
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
source "${XDG_CONFIG_HOME}/lf/lfcd.sh"
source "/usr/share/LS_COLORS/dircolors.sh"
export CITY="~/53chan/struppi-city"

# aliases
[ -f "${ZDOTDIR}/.zsh_aliases" ] && source "${ZDOTDIR}/.zsh_aliases"
export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'

# application paths
export KITTY_CONFIG_DIRECTORY="$HOME/.config/kitty"
export XDG_CONFIG_HOME="$HOME/.config"

# theme
source $ZDOTDIR/themes/nanotech.zsh-theme

# set completion colors to be the same as `ls`, after theme has been loaded
[[ -z "$LS_COLORS" ]] || zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
