{
  description = "Yannmm's macOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    darwin.url = "github:nix-darwin/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ nixpkgs, darwin, home-manager, nix-vscode-extensions, mac-app-util, ... }: {
    darwinConfigurations = {
      "CDU-DP75M9GNWD" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        modules = [
          mac-app-util.darwinModules.default

          ./modules/aerospace.nix

          {
            nixpkgs.config.allowUnfree = true;

            nixpkgs.overlays = [
              nix-vscode-extensions.overlays.default
            ];
          }

          ./hosts/cdu-dp75m9gnwd.nix

          home-manager.darwinModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.sharedModules = [
              mac-app-util.homeManagerModules.default
            ];

            home-manager.users.rayman = {
              imports = [
                ./home.nix
                ./modules/claude-code.nix
                ./modules/opencode.nix
                ./modules/vscode.nix
              ];
            };
          }
        ];
      };

      "Ximmer" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        modules = [
          ./hosts/ximmer.nix
          ./modules/aerospace.nix

          home-manager.darwinModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # home-manager.users.yannmm = import ./home.nix;
            home-manager.users.yannmm = {
              imports = [
                ./home.nix
                ./modules/opencode.nix
              ];
            };
          }
        ];
      };
    };
  };
}
