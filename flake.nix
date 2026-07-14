{
  description = "Single host NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs"; # Keep versions synced
    };
    stylix.url = "github:danth/stylix";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, nvf, ... }@inputs: {
    nixosConfigurations.vrss = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/laptop
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        nvf.nixosModules.default
      ];
    };
  };
}
