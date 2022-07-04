{ config, lib, options, pkgs, ... }:
with lib;
let
  cfg = config.ece;
  system = pkgs.stdenv.system;

  overlayType = mkOptionType {
    name = "nixpkgs-overlay";
    description = "nixpkgs overlay";
    check = builtins.isFunction;
    merge = lib.mergeOneOption;
  };
in
{
  options.ece = {
    pkgs = mkOption {
      description = "legacyPkgs from pin";
      type = with types; attrsOf attrs;
      readOnly = true;
    };
    pins = mkOption {
      description = "nix things to pin into the PATH and registry";
      type = with types; attrsOf attrs;
    };
    config = mkOption {
      description = "Options to pass to all nixpks.";
      type = types.attrs;
      default = {};
    };
    overlays = mkOption {
      description = "Overlays which should be loaded for all versions of nixpkgs";
      type = with types; attrsOf unspecified;
      default = {};
    };
  };

  config = mkMerge [
    (optionalAttrs
      (options ? "nix") {
        nix = {
          registry = mapAttrs (_: v: {
            flake = v;
          }) cfg.pins;
          nixPath = mapAttrsToList (n: v: "${n}=${v}") cfg.pins;
        };
      })
    (optionalAttrs
      (options ? "nixpkgs")
      {
        nixpkgs.config = cfg.config;
        nixpkgs.overlays = mapAttrsToList (_: v: v) cfg.overlays;
      })
    {

      ece.pkgs =
        mapAttrs
          (n: v: import v {
            inherit system;
            config = cfg.config;
            overlays = (mapAttrsToList (_: v: v) cfg.overlays);
          })
          (filterAttrs (n: v: builtins.hasAttr "legacyPackages" v) cfg.pins);
    }
  ];
}
