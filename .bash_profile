#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
if [ -e /home/ece/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ece/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi

export HISTFILE=~/.bash_eternal_history
shopt -s histappend
export HISTFILESIZE=
export HISTSIZE=
