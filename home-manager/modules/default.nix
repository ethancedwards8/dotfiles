{ ... }:

{
  imports = [
    ./bspwm.nix
    ./cli.nix
    ./emacs.nix
    # ./firefox.nix
    # ./games.nix
    ./gpg.nix
    # ./home-manager.nix
    ./languages-and-server.nix
    ./linux-specific.nix
    ./minecraft.nix
    ./neomutt.nix
    ./neovim.nix
    ./nix-du.nix
    ./polybar.nix
    # ./pin-nixpkgs.nix
    ./terminals.nix
  ];
  services.emacs = {
    enable = true;
    client.enable = true;
  };
  xdg.userDirs.enable = false;
  xdg.userDirs.desktop = "";
  services.gpg-agent.enable = true;
}
