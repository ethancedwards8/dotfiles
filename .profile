export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:~/scripts"
export PATH="$PATH:/aur/flutter/bin"
export PATH="$PATH:~/.local/bin/"
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export PATH=~/.npm-global/bin:$PATH
export NVIM_LOG_FILE=/tmp/nvimlogfile

# home-manager nix stuffz
# . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
