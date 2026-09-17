{ pkgs, ... }:

{
  imports = [
    
  ];

  system.primaryUser = "ryan";

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
      "ryan"
    ];
  };

  environment.systemPackages = [
    pkgs.vim
    pkgs.lcov
    pkgs.wrangler
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.shells = [ pkgs.zsh ];

  users.users.ryan = {
    name = "ryan";
    home = "/Users/ryan";
    shell = pkgs.zsh;
  };

  system.stateVersion = 4;

  homebrew = {
    enable = true;

    # IMPORTANT while migrating an existing Mac.
    onActivation.cleanup = "zap";

    casks = [
      "google-chrome"
      # "raycast"
      "orbstack"
      "maccy"
      "gitup-app"
      "dbeaver-community"
      "tencent-lemon"
    ];

    brews = [
      "mas"
    ];

    masApps = {
      Xcode = 497799835;
    };
  };
}