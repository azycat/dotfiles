# what OS are we running?
if [[ $(uname) == "Darwin" ]]; then
    source "$ZDOTDIR"/os/mac.zsh    
else
    source "$ZDOTDIR"/os/arch.zsh    
fi

# must be last
eval "$(zoxide init zsh)"
