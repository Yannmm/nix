{ pkgs, ... }:

{
  system.primaryUser = "yannmm";

  nix.enable = true;

  # IMPORTANT:
  # Verify this on Ximmer before using it:
  # dscl . -read /Groups/nixbld PrimaryGroupID
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

  programs.zsh.enable = true;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.yannmm = {
    name = "yannmm";
    home = "/Users/yannmm";
  };

  system.stateVersion = 4;

  homebrew = {
    enable = true;

    onActivation.cleanup = "none";

    casks = [
      # Put Ximmer-specific GUI apps here.
    ];
  };
}