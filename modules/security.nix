{ config, lib, pkgs, ... }:

{
  security.doas.enable = true;
  security.pam.services.ece.gnupg.enable = true;
}
