{ pkgs, ... }:

{
  system.primaryUser = "rayman";

  nix.enable = true;

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

  programs.zsh.enable = true;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.rayman = {
    name = "rayman";
    home = "/Users/rayman";
  };

  system.stateVersion = 4;
}