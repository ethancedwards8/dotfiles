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

  security.pki.caCertificateBlacklist = [
    "Comodo AAA Services root"
    "emSign ECC Root CA - G3"
  ];

  environment.shellAliases = {
    nbc = "nix-build --arg config '{ allowUnfree = true; cudaSupport = true; }'";
    nbr = "nix-build --arg config '{ allowUnfree = true; rocmSupport = true; }'";
    nr = "nixpkgs-review pr --post-result";
    nrn = "nixpkgs-review pr --no-shell --post-result";
    nra = "nixpkgs-review pr --no-shell --post-result --approve-pr";
    nrm = "nixpkgs-review pr --no-shell --post-result --approve-pr --merge";
    nrc = "nixpkgs-review pr --no-shell --post-result --extra-nixpkgs-config '{ allowUnfree = true; cudaSupport = true; }'";
    nrr = "nixpkgs-review pr --no-shell --post-result --extra-nixpkgs-config '{ allowUnfree = true; rocmSupport = true; }'";
    nix = "nix -vL";
    cat = "bat";
  };

  environment.enableAllTerminfo = true;
}
