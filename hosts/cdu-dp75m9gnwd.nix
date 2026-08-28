{ pkgs, ... }:

{
  imports = [
    ../modules/claude-code.nix
    ../modules/aerospace.nix
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
    # pkgs.aerospace
  ];

  programs.zsh.enable = true;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.rayman = {
    name = "rayman";
    home = "/Users/rayman";
  };

  system.stateVersion = 4;

  homebrew = {
    enable = true;

    # IMPORTANT while migrating an existing Mac.
    onActivation.cleanup = "none";

    casks = [
      "google-chrome"
      # "raycast"
      # "orbstack"
      # "visual-studio-code"
    ];
  };
}