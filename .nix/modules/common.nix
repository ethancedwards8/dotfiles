{ pkgs, config, lib, inputs, ... }:

{
  imports = [
    ./packages.nix
    ./nix.nix
    ./fun.nix
  ];

  programs.nix-index.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.shellAliases = {
      nr = "nixpkgs-review pr --post-result";
      nra = "nixpkgs-review pr --no-shell --post-result --approve-pr";
      nrm = "nixpkgs-review pr --no-shell --post-result --approve-pr --merge";
      nrc = "nixpkgs-review pr --no-shell --post-result --extra-nixpkgs-config '{ allowUnfree = true; cudaSupport = true; }'";
      nix = "nix -vL";
      cat = "bat";
  };

  environment.enableAllTerminfo = true;
}
