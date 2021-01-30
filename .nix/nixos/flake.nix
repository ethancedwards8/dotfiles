{
  description = "Ethan's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, nur, ...}@inputs:
  let
    configuration = import ./configuration.nix;

    cachix = import ./cachix.nix;

    overlays = [

    ];
   in
   {
     nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [ cachix configuration {nixpkgs.overlays = [ nur.overlay ]; } ];
       # inputs = inputs;
     };
   };
}
