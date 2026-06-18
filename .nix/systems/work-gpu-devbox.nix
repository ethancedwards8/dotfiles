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
  ];

  networking.hostName = lib.mkForce "work-gpu-devbox";
}
