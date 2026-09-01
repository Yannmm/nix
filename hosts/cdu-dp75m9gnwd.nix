{ pkgs, ... }:

{
  imports = [
    
  ];

  system.primaryUser = "rayman";

  nix.enable = true;

  # This matches the existing Nix installation on this Mac.
  ids.gids.nixbld = 350;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    max-jobs = "auto";

    trusted-users = [
      "root"
      "rayman"
    ];
  };

  environment.systemPackages = [
    pkgs.vim
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.shells = [ pkgs.zsh ];

  users.users.rayman = {
    name = "rayman";
    home = "/Users/rayman";
    shell = pkgs.zsh;
  };

  system.stateVersion = 4;

  homebrew = {
    enable = true;

    # IMPORTANT while migrating an existing Mac.
    onActivation.cleanup = "none";

    casks = [
      "google-chrome"
      # "raycast"
      "orbstack"
    ];
  };
}