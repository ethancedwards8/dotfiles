{
  description = "Ethan's nixos configuration";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  inputs.nixos-hardware.url = "github:nixos/nixos-hardware";

  outputs = { self, nixpkgs, ... }@inputs: {
     nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [ ./configuration.nix ];
     };
  };
}
