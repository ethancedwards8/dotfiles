{ pkgs, config, lib, inputs, ... }:

{
  # nixpkgs.config.structuredAttrsByDefault = true;
  #
  nix.channel.enable = false;
  nix.gc.automatic = true;
  nix.settings.trusted-users = [
    "root"
    "ece"
    "@wheel"
    "@admin"
  ];
  nix.settings.sandbox = true;
  nix.package = pkgs.nixVersions.latest;
  # nix.package = inputs.exa.packages.${pkgs.stdenv.hostPlatform.system}.nix-cli;
  # nix.package = inputs.lix.packages.${pkgs.stdenv.hostPlatform.system}.nix-cli;
  # nix.package = inputs.nix.packages.${pkgs.stdenv.hostPlatform.system}.nix-cli;
  nix.extraOptions = ''
    experimental-features = nix-command flakes ca-derivations
    builders-use-substitutes = true
    auto-optimise-store = true
    sandbox = true
    extra-platforms = aarch64-darwin x86_64-darwin x86_64-linux i686-linux
  '';

  # thank you @elvishjerricco:matrix.org!
  # map flake inputs to registry
  nix.registry = lib.mapAttrs (n: flake: { inherit flake; }) inputs;

  # fix legacy channels
  environment.etc = lib.mapAttrs' (name: flake: {
    name = "nix/inputs/${name}";
    value.source = flake.outPath;
  }) inputs;
  nix.nixPath = [ "/etc/nix/inputs" ];

}
