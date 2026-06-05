# some things are easier this way on darwin
{ pkgs, self, lib, inputs, options, ... }:

{

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    masApps = {
      # none shared currently
    };

    brews = [
      "bash"
      "ca-certificates" # weird nix thing i think idrk
      "eza"
      "ffmpeg"
      "fzf"
      "gh"
      "git"
      "git-lfs"
      "gnupg"
      "htop"
      "jq"
      "mas"
      "neovim"
      "nmap"
      "node"
      "pinentry"
      "pnpm"
      "ripgrep"
      "starship"
      "tmux"
      "uv"
      "wget"
      "zig"
    ];

    casks = [
      "brave-browser"
      "firefox"
      "kitty"
      "okta-verify"
      "orbstack"
      "postman"
      "zed"
      "zotero"
    ];
  };

}
