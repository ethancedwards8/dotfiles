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

alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# complete -F _complete_alias config
alias sudo="sudo "
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
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

# PS1='[\u@\h \W]\$ '

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# export PS1="\u@\[\e[37m\]\h\[\e[m\]:\[\e[32m\]\w\[\e[m\]\[\e[31m\]\\$\[\e[m\] "

# if [[ $TERM = xterm* ]]
# then
#     HN_CLR='\[\033[01;36m\]' # Hostname
#     UR_CLR='\[\033[01;33m\]' # Username
#     WD_CLR='\[\033[01;34m\]' # Working directory
#     AT_CLR='\[\033[01;31m\]' # @ symbol
#     DL_CLR='\[\033[01;32m\]' # Dollar sign after the prompt
#     VC_CLR='\[\033[01;37m\]' # Version Control
#     RT_CLR='\[\033[00m\]'    # Reset all colors
# fi

# PS1="${UR_CLR}\u${AT_CLR}@${HN_CLR}\h ${WD_CLR}\w${RT_CLR}"

# # Git prompt
# if command -v git >/dev/null
# then
#     GIT_PS1_DESCRIBE_STYLE=branch
#     GIT_PS1_SHOWDIRTYSTATE=1
#     GIT_PS1_SHOWSTASHSTATE=1
#     GIT_PS1_SHOWUNTRACKEDFILES=1
#     GIT_PS1_SHOWUPSTREAM=verbose
#     PS1+="${VC_CLR}\$(__git_ps1)${RT_CLR}"
# fi

# PS1+="\n${DL_CLR}\$${RT_CLR} "

# pfetch
# ls
