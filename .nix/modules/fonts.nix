{ config, lib, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [ jetbrains-mono emacs-all-the-icons-fonts ];
  };
}
