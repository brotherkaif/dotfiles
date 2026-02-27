{ config, pkgs, gitEmail, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      url = {
        "ssh://git@github.com/" = {
          insteadOf = "https://github.com/";
        };
      };

      user.name = "Kaif Ahmed";
      user.email = gitEmail;

      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
}
