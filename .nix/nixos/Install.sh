#!/usr/bin/env bash
ln -s $(pwd) /etc/nixos
sudo nixos-rebuild switch --flake '/etc/nixos#$1'
