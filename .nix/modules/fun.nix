{ pkgs, config, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    leetgo
  ];
}
