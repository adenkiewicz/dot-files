ZSH_HOME="$(dirname $(readlink -f $HOME/.zshrc))"

source $ZSH_HOME/prompt.zsh
source $ZSH_HOME/setopts.zsh
source $ZSH_HOME/bindkeys.zsh
source $ZSH_HOME/exports.zsh
source $ZSH_HOME/aliases.zsh
source $ZSH_HOME/completion.zsh
source $ZSH_HOME/helpers.zsh
