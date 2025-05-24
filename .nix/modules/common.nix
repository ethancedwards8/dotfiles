{ pkgs, config, lib, inputs, ... }:

{
  imports = [
    ./packages.nix
  ];

  programs.direnv.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.shellAliases = {
      nr = "nixpkgs-review pr --no-shell --post-result";
  };
}
