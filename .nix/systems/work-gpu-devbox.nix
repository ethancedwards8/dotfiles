{
  config,
  pkgs,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    ./work-devbox.nix # exact same except we have cuda

    ../modules/cuda.nix
  ];

  networking.hostName = lib.mkForce "work-gpu-devbox";
}
