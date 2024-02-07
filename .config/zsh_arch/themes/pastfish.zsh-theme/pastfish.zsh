#!/usr/bin/env zsh
#
#references: https://github.com/pastleo/theme-PastFish
#https://github.com/agnoster/agnoster-zsh-theme/blob/6bba672c7812a76defc3efed9b6369eeee2425dc/agnoster.zsh-theme
# https://blog.carbonfive.com/writing-zsh-themes-a-quickref/
#
### segments of the prompt, default order declaration

typeset -aHg PROMPT_SEGMENTS=(
    prompt_status
    prompt_context
    prompt_dir
    prompt_git
    prompt_end
)

username() {
    
}
# Git: branch/detached head, dirty status
prompt_git() {
  local color ref
  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }
  ref="$vcs_info_msg_0_"
    if [[ -w $PWD ]]; then #has write permission
        if [[ -n "$ref" ]]; then
                if is_dirty; then
                color=yellow
                ref="${ref} $PLUSMINUS"
                else
                color=black
                ref="${ref} "
                fi
            if [[ "${ref/.../}" == "$ref" ]]; then
            ref="$BRANCH $ref"
            else
            ref="$DETACHED ${ref/.../}"
        fi
    else
    prompt_segment $color $PRIMARY_FG
    print -n " $ref"
    fi
}

## Main Prompt
prompt_main() {
        prompt_git
    else
        color=red
    fi

}

prompt_precmd() {
    vcs_info
    #PROMPT='%{%f%b%k%}$(prompt_main)'
}

prompt_setup() {
    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    prompt_opts=(cr subst percent)

    add-zsh-hook precmd prompt_precmd

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:git*' formats '%b'
    zstyle ':vcs_info:git*' actionformats '%b (%a)'
}
