{ pkgs, ... }:

{
  imports = [
  ];

  system.primaryUser = "yannmm";

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
      "yannmm"
    ];
  };

  environment.systemPackages = [
    pkgs.vim
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.shells = [ pkgs.zsh ];

  users.users.yannmm = {
    name = "yannmm";
    home = "/Users/yannmm";
    shell = pkgs.zsh;
  };

  system.stateVersion = 4;

  homebrew = {
    enable = true;

    onActivation.cleanup = "none";

    casks = [
      # Put Ximmer-specific GUI apps here.
      "google-chrome"
      "orbstack"
    ];
  };
}