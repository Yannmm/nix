{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Rayman Yan";
      user.email = "ryan@aligntech.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
}