{ mkShell, nixpkgs-fmt, git, brave }:

mkShell {
  name = "system-and-home-pull-on-entry";

  buildInputs = [ nixpkgs-fmt git brave /* I want it in my store, but not in my env */ ];

  shellHook = ''
    ${git}/bin/git pull origin master
  '';
}
