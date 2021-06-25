if [[ $TERM_PROGRAM == 'Apple_Terminal' ]]; then
  return
fi

######################### prompt ###########################
unsetopt beep
setopt prompt_subst
PROMPT=$'%{\e[34m%}%B%* %n%# %b%{\e[39m%}'
RPROMPT=$'%{\e[32m%}%B%(7~,.../,)%6~%b%{\e[39m%}'


######################### environment vars ###########################
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.tex=01;33:*.sxw=01;33:*.sxc=01;33:*.lyx=01;33:*.pdf=0;35:*.ps=00;36:*.asm=1;33:*.S=0;33:*.s=0;33:*.h=0;31:*.c=0;35:*.cxx=0;35:*.cc=0;35:*.C=0;35:*.o=1;30:*.am=1;33:*.py=0;34:'
export TERM=xterm-256color
export GOPATH="$HOME/workspace/go"
export NVM_DIR="$HOME/.nvm"


######################### PATH #######################################
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="/Users/anna/Library/Python/2.7/bin/:$PATH"


######################### aliases ####################################
alias orig-ls=ls

if [[ $(uname) == 'Darwin' ]]; then
  # requires GNU coreutils. OS X decided to implement their
  # own crappy versions that don't work the same.
  alias orig-ls='gls'
fi

alias grep='grep --color=auto'
alias ls='orig-ls --color=auto'
alias ll='ls -lh'
alias la='ls -a'
alias less='less -R'
alias vi=vim
# One tmux session to rule them all
alias orig-tmux=`which tmux`
alias jets='AWS_PROFILE=abweb_dev jets'
alias cdk='npm run-script --silent env -- cdk'
alias npm="echo 'Use pnpm instead or `which npm`'"

######################### key bindings ###############################
bindkey -v # vi mode
KEYTIMEOUT=1 # Minimize wait for <ESC> to register
bindkey "^R" history-incremental-search-backward
bindkey "^E" end-of-line
bindkey "^F" beginning-of-line

# Pushes current command on command stack and gives blank line, after that
# line runs command stack is popped
bindkey "^T" push-line-or-edit

######################### misc #######################################
eval "$(rbenv init -)"


######################### functions ##################################
# Make 'exit' in tmux just detach
function exit {
    if [[ -z $TMUX ]]; then
        builtin exit
    else
        orig-tmux detach
    fi
}


######################### zsh options ################################
setopt ALWAYS_TO_END   # Push that cursor on completions.
setopt AUTO_NAME_DIRS  # change directories  to variable names
setopt AUTO_PUSHD      # push directories on every cd
setopt NO_BEEP         # self explanatory


######################### history options ############################
setopt EXTENDED_HISTORY        # store time in history
setopt HIST_EXPIRE_DUPS_FIRST  # unique events are more usefull to me
setopt HIST_VERIFY	           # Make those history commands nice
setopt INC_APPEND_HISTORY      # immediatly insert history into history file
HISTSIZE=16000                 # spots for duplicates/uniques
SAVEHIST=15000                 # unique events guarenteed
HISTFILE=~/.history
setopt histignoredups          # ignore duplicates of the previous event


######################### completion #################################
setopt COMPLETE_IN_WORD
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl true

autoload zmv
alias 'zcp=noglob zmv -W -C'
alias 'zln=noglob zmv -W -L'
alias 'zmv=noglob zmv -W -M'

autoload -U compinit
compinit
# End of lines added by compinstall


# added by travis gem
[ -f /Users/anna/.travis/travis.sh ] && source /Users/anna/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
