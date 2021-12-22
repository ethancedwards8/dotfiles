{ config, pkgs, lib, ... }:
# let
#   inherit (config.ece.pkgs) nixpkgs;
# in

# let
#   nixPath = builtins.concatStringsSep ":" [
#     "nixpkgs=${nixpkgs}"
#     "/nix/var/nix/profiles/per-user/root/channels"
#   ];
# in
# {
#   home = {
#     sessionVariables = { NIX_PATH = nixPath; };
#   };
# }
