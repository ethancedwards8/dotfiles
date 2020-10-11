#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""
# export PATH="$PATH:
export PATH="$PATH:~/scripts"
export PATH="$PATH:/aur/flutter/bin"
export PATH="$PATH:~/.emacs.d/bin"
export PATH="$PATH:~/.local/bin"
export GOPATH="/home/ece/.go"
export DENO_INSTALL="/home/ece/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$PATH:~/.gem/ruby/2.7.0/bin"
export EDITOR=nvim

# set -o vi

alias e="emacsclient -t"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# complete -F _complete_alias config
alias sudo="sudo "
alias ..="cd .."
alias ...="cd ../.."
# alias gs="git status"
alias gp="git pull"
alias vim="nvim"
alias mutt="neomutt"
# alias ls='ls --color=auto'
alias ls='exa --color=always'
alias ll='exa --color=always -l'
alias la='exa --color=always -a'
alias lah='exa --color=always -lah'
alias rm="rm -i"
alias mv="mv -i"

# source /usr/share/wikiman/widgets/widget.bash
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# PS1='[\u@\h \W]\$ '

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
