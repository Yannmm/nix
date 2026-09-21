{ ... }:

{
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        UseKeychain = "yes";
      };

      "github-personal" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519_personal";
        IdentitiesOnly = true;
      };

      "github-work" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519_work";
        IdentitiesOnly = true;
      };
    };
  };
}