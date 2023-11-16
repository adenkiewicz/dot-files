if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

export EDITOR="vim"
export VISUAL="vim"
export PAGER='less'

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history

#export SEMGREP_SEND_METRICS=off

# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
