{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs , ... }: {
    nixosConfigurations = {
      aria = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./host/aria/configuration.nix
          inputs.home-manager.nixosModules
        ];
      };
    };
  };
}
