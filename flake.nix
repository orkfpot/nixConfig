{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

<<<<<<< HEAD
<<<<<<< HEAD
  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      aria = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/aria/configuration.nix
        ];
      };
      gerald = nixpkgs.lob.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/gerald/configuration.nix
=======
=======
>>>>>>> dfe3c170670b4a08ab5c9587d3abd3197a7a157b
  outputs = { nixpkgs , ... }: {
    nixosConfigurations = {
      aria = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./host/aria/configuration.nix
          inputs.home-manager.nixosModules
<<<<<<< HEAD
>>>>>>> dfe3c170670b4a08ab5c9587d3abd3197a7a157b
=======
>>>>>>> dfe3c170670b4a08ab5c9587d3abd3197a7a157b
        ];
      };
    };
  };
}
