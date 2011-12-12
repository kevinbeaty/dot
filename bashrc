# Check for an interactive session
if [[ -n "$PS1" ]]; then

  export PS1='\[\e[32m\]\h \[\e[33m\]\W $(__git_ps1 "(%s)")\[\e[0m\]\$ '

  # vim for editor, console, vi
  export EDITOR=vim
  set -o vi
  alias vi='vim'

  alias ..='cd ..'

  # Duplicate commands will not append bash history
  export HISTCONTROL=ignoredups
  
  # add ~/local/bin if exists
  if [ -d $HOME/local/bin ] ; then
    PATH=$HOME/local/bin:$PATH
  fi

  # add ~/bin if exists
  if [ -d $HOME/bin ] ; then
    PATH=$HOME/bin:$PATH
    
    # source git_completion if exists
    if [ -s $HOME/bin/git-completion.bash ] ; then
      source $HOME/bin/git-completion.bash
    fi

  fi


fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# virtualenvwrapper
if [ -s /usr/bin/virtualenvwrapper.sh ] ; then
    export WORKON_HOME="$HOME/.virtualenvs"
    export PROJECT_HOME="$HOME/projects"
    source /usr/bin/virtualenvwrapper.sh
fi

