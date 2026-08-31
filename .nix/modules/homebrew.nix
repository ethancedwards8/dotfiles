# some things are easier this way on darwin
{ pkgs, self, lib, inputs, options, ... }:

{

  homebrew = {
    enable = true;

    brews = [
      "bash"
      "ca-certificates" # weird nix thing i think idrk
      "mas"
      "neovim"
      "pinentry"
    ];

    casks = [
      "okta-verify"
      "orbstack"
      "postman"
      "zed"
    ];
  };

}
