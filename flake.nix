{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations.aria = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./host/aria/configuration.nix
      ];
    };
  };
}