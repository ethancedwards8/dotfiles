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
export PATH="$PATH:~/.node/bin"
export PATH=$GOPATH:$GOPATH/bin:${PATH}
if [ -e /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
export EDITOR=nvim
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# set -o vi

alias yeet="paru"
alias e="emacsclient -c"
alias et="emacsclient -t"
alias sudo="sudo "
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# complete -F _complete_alias config
alias sudo="sudo "
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
# alias gs="git status"
# alias gp="git pull"
alias vim="nvim"
alias mutt="neomutt"
# alias ls='ls --color=auto'
alias ls='eza --color=always'
alias ll='eza --color=always -l'
alias la='eza --color=always -a'
alias lah='eza --color=always -lah'
# sl alias because i mess up sometimes and its annoying
alias sl='eza --color=always'
alias ip='ip -c=always'
alias rm="rm -i"
alias mv="mv -i"
alias scrot="scrot -s"

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

PS1='[\u@\h \W]\$ '

# stops tmux from entering with my theme broken
tfun()
{
if [[ $TERM == screen* ]] && [[ "$HOSTNAME" == "archpc" ]]; then
	bash ~/.config/tmux/plugins/tmux/dracula.tmux
fi
}

if [[ "$HOSTNAME" == arch* ]] || [[ "$HOSTNAME" == *Air* ]]; then
    eval "$(starship init bash)"
fi


vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

# https://unix.stackexchange.com/questions/12107/how-to-unfreeze-after-accidentally-pressing-ctrl-s-in-a-terminal
# stop the awful terminal freeze
stty -ixon

# Added by Radicle.
export PATH="$PATH:/Users/ece/.radicle/bin"
. "$HOME/.cargo/env"
