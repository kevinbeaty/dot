# Check for an interactive session
if [[ -n "$PS1" ]]; then

  PS1='[\u@\h \W]\$ '

  # vim for editor, console, vi
  EDITOR=vim
  set -o vi
  alias vi='vim'

  # Colors
  alias ls='ls -hF --color=always'
  alias diff='colordiff'              # requires colordiff package
  alias grep='grep --color=auto'
  eval $(dircolors -b)

  # Duplicate commands will not append bash history
  HISTCONTROL=ignoredups

  # add ~/bin if exists
  if [ -d ~/bin ] ; then
    PATH=$PATH:~/bin
  fi

fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

