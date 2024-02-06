source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh #disables compinit

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect '\r' .accept-line

+autocomplete:recent-directories() {
typeset -ga reply=( $(zoxide query -l) )
}

zstyle ':autocomplete:*' delay 0.1  # seconds (float)
zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 8
zstyle ':autocomplete:history-search-backward:*' list-lines 8

# reset ctrl S
() {
   local -a prefix=( '\e'{\[,O} )
   local -a up=( ${^prefix}A ) down=( ${^prefix}B )
   local key=
   for key in $up[@]; do
      bindkey "$key" up-line-or-history
   done
   for key in $down[@]; do
      bindkey "$key" down-line-or-history
   done
}
() {
	zle -A {.,}history-incremental-search-backward
	bindkey -M emacs '^S' history-incremental-search-forward
}


# _zoxide_zsh_tab_completion() {
#     (( $+compstate )) && compstate[insert]=menu
#     local keyword="${words:2}"
#     local completions=(${(@f)"$(zoxide query -l "$keyword")"})


#     if [[ ${#completions[@]} == 0 ]]; then
#         _files -/
#     else
#         compadd -U -V z "${(@)completions}"
#     fi
# }

# if [ "${+functions[compdef]}" -ne 0 ]; then
#     compdef _zoxide_zsh_tab_completion z 2> /dev/null
# fi
