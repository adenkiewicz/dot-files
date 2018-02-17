# Always use vim bindings
bindkey -v

# change prompt when in VIM mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT=$(print '%{\033[3;31m%}<% VIM>% %{\e[0m%}')
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# use RPS1 only on current line
setopt transientrprompt

# remove delay before entering in VIM mode
export KEYTIMEOUT=1

# fix backspace behavior after coming from VIM mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# add support for ^R search
bindkey '^R' history-incremental-search-backward
