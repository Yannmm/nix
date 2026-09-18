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
    pkgs.wrangler
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

    onActivation.cleanup = "zap";

    casks = [
      "google-chrome"
      "orbstack"
      "maccy"
      "gitup-app"
      "dbeaver-community"
      "tencent-lemon"
      "grandperspective"
    ];

    brews = [
      "create-dmg"
      "mas"
    ];

    masApps = {
      Xcode = 497799835;
      Numbers = 409203825;
      Shadowrocket = 932747118;
      "剪映专业版" = 1529999940;
    };
  };
}