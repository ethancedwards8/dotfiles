# Created by newuser for 5.8

# set -o vi

alias sudo="sudo "
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias vim="nvim"
alias mutt="neomutt"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
if [ -e /home/ece/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ece/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
