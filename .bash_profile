#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
if [ -e /home/ece/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ece/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
if [ -e $HOME/.cargo/env ]; then . "$HOME/.cargo/env"; fi

export HISTFILE=~/.bash_eternal_history
shopt -s histappend
export HISTFILESIZE=
export HISTSIZE=
