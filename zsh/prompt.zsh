# Set up the prompt
autoload -Uz promptinit && promptinit

export PS1="$(print '%{\e[31m%}<%{\e[0m%}%n%{\e[34m%}@%{\e[0m%}%m%{\e[31m%}>%{\e[0m%}%~%(?.%{\e[0m%}.%{\e[32m%})%(!.#.$)%{\e[0m%} ')"
