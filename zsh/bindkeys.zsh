# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# fix for delete key
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char
bindkey "^[[1~"  beginning-of-line
bindkey "^[[4~"  end-of-line
