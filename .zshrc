# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT=$'%{\e[1;34m%}[%T %n]%#%{\e[0m%} '
RPROMPT=$'%{\e[0;32m%}%~%{\e[0m%}'

# Env Vars

# PATH

# Aliases
alias ls='/bin/ls --color=auto'
alias ll='/bin/ls -lh --color=auto'
alias la='/bin/ls -a --color=auto'
alias less='/usr/bin/less -R'

