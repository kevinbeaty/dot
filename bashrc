# Check for an interactive session
if [[ -n "$PS1" ]]; then

  PS1='\[\e[32m\]\h \[\e[33m\]\W $(__git_ps1 "(%s)")\[\e[0m\]\$ '

  # vim for editor, console, vi
  EDITOR=vim
  set -o vi
  alias vi='vim'

  # Colors
  alias ls='ls -hF --color=always'
  alias diff='colordiff'              # requires colordiff package
  alias grep='grep --color=auto'
  eval $(dircolors -b)

  alias ..='cd ..'

  # Duplicate commands will not append bash history
  HISTCONTROL=ignoredups
  
  # add ~/local/bin if exists
  if [ -d $HOME/local/bin ] ; then
    PATH=$HOME/local/bin:$PATH
  fi

  # add ~/bin if exists
  if [ -d $HOME/bin ] ; then
    PATH=$HOME/bin:$PATH
    
    # source git_completion if exists
    if [ -r $HOME/bin/git-completion.bash ] ; then
      . $HOME/bin/git-completion.bash
    fi

  fi


fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

