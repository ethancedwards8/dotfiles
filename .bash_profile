#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
export GPG_TTY=$(tty)
if [ -e /home/ece/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ece/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
