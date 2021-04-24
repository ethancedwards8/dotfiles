{ config, lib, pkgs, ... }:

{
  nix.package = pkgs.nixUnstable;
  nix.trustedUsers = [ "root" "ece" "@wheel" "@admin" ];
  nix.autoOptimiseStore = true;
  nix.extraOptions = # lib.optionalString (config.nix.package == pkgs.nixFlakes) 
  ''
    experimental-features = nix-command flakes ca-references
    builders-use-substitutes = true
  '';
  nix.distributedBuilds = true;

  # TODO: OLD
  # nix.buildMachines = [{
    # hostName = "builder-nixpc";
    # systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" ];
    # maxJobs = 3;
    # speedFactor = 2;
    # supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
    # mandatoryFeatures = [ ];
  # }# {
  #   hostName = "builder-fedora";
  #   systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" ];
  #   maxJobs = 3;
  #   speedFactor = 2;
  #   supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
  #   mandatoryFeatures = [ ];
  # }
                      # ];
}