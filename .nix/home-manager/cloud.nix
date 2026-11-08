{ lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    awscli2
    k9s
    kubectl
    modal
  ];
}
