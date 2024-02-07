# initialize plugins and completions
plugins=(bgnotify common-aliases cp last-working-dir macos vim-ctrl-z)
source $ZDOTDIR/init.zsh

# aliases
[ -f "${ZDOTDIR}/.zsh_aliases" ] && source "${ZDOTDIR}/.zsh_aliases"

# application paths
export KITTY_CONFIG_DIRECTORY="$HOME/.config/kitty"

# brew plugins
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# theme
source $ZDOTDIR/themes/nanotech.zsh-theme

# set completion colors to be the same as `ls`, after theme has been loaded
[[ -z "$LS_COLORS" ]] || zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
