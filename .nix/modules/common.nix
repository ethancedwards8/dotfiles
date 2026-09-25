{ pkgs, config, lib, inputs, ... }:

{
  imports = [
    ./packages.nix
    ./nix.nix
    ./fun.nix
    ./cachix.nix
  ];

  programs.nix-index.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.shellAliases = {
    nbc = "nix-build --arg config '{ allowUnfree = true; cudaSupport = true; }'";
    nr = "nixpkgs-review pr --post-result --tests";
    nrn = "nixpkgs-review pr --no-shell --post-result --tests";
    nra = "nixpkgs-review pr --no-shell --post-result --approve-pr --tests";
    nrm = "nixpkgs-review pr --no-shell --post-result --approve-pr --merge --tests";
    nrc = "nixpkgs-review pr --no-shell --post-result --tests --extra-nixpkgs-config '{ allowUnfree = true; cudaSupport = true; }'";
    nix = "nix -vL";
    cat = "bat";
  };

  environment.enableAllTerminfo = true;
}
