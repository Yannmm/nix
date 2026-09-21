{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;

      "includeIf \"hasconfig:remote.*.url:git@github-personal:*/**\"".path =
        "~/.config/git/config-personal";

      "includeIf \"hasconfig:remote.*.url:git@github-work:*/**\"".path =
        "~/.config/git/config-work";
    };
  };

  home.file.".config/git/config-personal".text = ''
    [user]
        name = Yannmm
        email = yannmm@foxmail.com
  '';

  home.file.".config/git/config-work".text = ''
    [user]
        name = Rayman Yan
        email = ryan@aligntech.com
  '';
}