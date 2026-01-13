{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

{
  hardware.bluetooth.enable = true;

  services.blueman.enable = true;
}
