{ pkgs, config, lib, ... }@inputs:

{
    nix.channel.enable = false;
    nix.settings.trusted-users = [ "root" "ece" "@wheel" "@admin" ];
    nix.settings.sandbox = true;
    nix.configureBuildUsers = true;
    nix.package = pkgs.nixVersions.latest;
    nix.extraOptions =
    ''
        experimental-features = nix-command flakes ca-derivations
        builders-use-substitutes = true
        auto-optimise-store = true
        sandbox = true
        extra-platforms = aarch64-darwin
    '';


}
