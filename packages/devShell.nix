{ pkgs }:

with pkgs;
mkShell {
  name = "system-and-home-pull-on-entry";

  # buildInputs = [ nixpkgs-fmt git ];
  buildInputs = [ nixpkgs-fmt git ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
    brave /* I want it in my store, but not in my env */
  ];

  shellHook = ''
    ${git}/bin/git pull origin master
  '';
}
