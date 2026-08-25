{
  description = "Yannmm's macOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    darwin.url = "github:nix-darwin/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, darwin, home-manager, ... }: {
    darwinConfigurations = {
      "CDU-DP75M9GNWD" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        modules = [
          ./hosts/cdu-dp75m9gnwd.nix

          home-manager.darwinModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.rayman = import ./home.nix;
          }
        ];
      };

      "Ximmer" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        modules = [
          ./hosts/ximmer.nix

          home-manager.darwinModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.yannmm = import ./home.nix;
          }
        ];
      };
    };
  };
}