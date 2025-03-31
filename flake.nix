{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self , nixpkgs , home-manager , ... }@inputs: {
    nixosConfigurations = {
      aria = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          { _module.args.inputs = inputs; }
          home-manager.nixosModules.default
          ./host/aria/configuration.nix
          ./base.nix
          ./default.nix
        ];
      };
      gerald = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          { _module.args.inputs = inputs; }
          home-manager.nixosModules.default
          ./host/gerald/configuration.nix
          ./base.nix
          ./modules/default.nix
          ./modules/gerald.nix
        ];
      };
    };
  };
}
