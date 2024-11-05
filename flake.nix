{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs , ... }: {
    nixosConfigurations = {
      aria = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/aria/configuration.nix
        ];
      };
    };
  };
}
