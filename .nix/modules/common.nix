{ pkgs, config, lib, inputs, ... }:

{
  imports = [
    ./packages.nix
  ];

  programs.nix-index.enable = true;

  programs.direnv.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.shellAliases = {
      nr = "nixpkgs-review pr --no-shell --post-result";
      nra = "nixpkgs-review pr --no-shell --post-result --approve-pr";
      nrm = "nixpkgs-review pr --no-shell --post-result --approve-pr --merge";
      nix = "nix -vL";
      cat = "bat";
  };

  environment.enableAllTerminfo = true;
}
