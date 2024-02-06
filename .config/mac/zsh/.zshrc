source $ZDOTDIR/nanotech.zsh-theme

source $ZDOTDIR/init.zsh
source $ZDOTDIR/.zsh_aliases

export KITTY_CONFIG_DIRECTORY="$HOME/.config/kitty"

## brew plugins
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh)"
