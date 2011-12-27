PROMPT='%1~ %(!.#.$) '
RPROMPT='!%!'

# vim for editor, console, vi
export EDITOR=vim
bindkey -v
alias vi='vim'

alias ..='cd ..'
export PAGER=less

setopt no_beep
setopt auto_cd
setopt multios
setopt cdable_vars
setopt prompt_subst

# History 
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups 
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history 

bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey ' ' magic-space    # also do history expansion on space

# ls colors
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
#export LS_COLORS

# Enable ls colors
# Find the option for using colors in ls, depending on the version: Linux or BSD
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

# Completion
autoload -U compinit
compinit -i

unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

zmodload -i zsh/complist

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select

# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " [${ref#refs/heads/}]"
}

#usage: title title 
#http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
function title {
    print -Pn "\e]2;$1:q\a" #set window name
}

#Appears when you have the prompt
function omz_termsupport_precmd {
  # left truncated pwd with git prompt
  title "%m %1~$(git_prompt_info)" 
}

#Appears at the beginning of (and during) of command execution
function omz_termsupport_preexec {
  title "%50<<$2%<<"
}

autoload -U add-zsh-hook
add-zsh-hook precmd  omz_termsupport_precmd
add-zsh-hook preexec omz_termsupport_preexec

# add /usr/local/bin if exists
if [ -d /usr/local/bin ]
then
    export PATH=/usr/local/bin:$PATH
fi
  
# add ~/local/bin if exists
if [ -d $HOME/local/bin ]
then
    export PATH=$HOME/local/bin:$PATH
fi

# add ~/bin if exists
if [ -d $HOME/bin ]
then
    export PATH=$HOME/bin:$PATH
fi

# Ammend PYTHONPATH for pyqt
if [ -d /usr/local/lib/python ]
then
    export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
fi

# Prepend shared python path if exists
if [ -d /usr/local/share/python ]
then
    export PATH=/usr/local/share/python:$PATH
fi

# virtualenvwrapper
if [ -s /usr/bin/virtualenvwrapper.sh ]
then
    export WORKON_HOME="$HOME/.virtualenvs"
    export PROJECT_HOME="$HOME/projects"
    source /usr/bin/virtualenvwrapper.sh
fi

if [ -s /usr/local/share/python/virtualenvwrapper.sh ]
then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    export WORKON_HOME="$HOME/.virtualenvs"
    export PROJECT_HOME="$HOME/projects"
    source /usr/local/share/python/virtualenvwrapper.sh
fi

