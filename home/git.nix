{ config, pkgs, gitEmail, ... }:

{
  programs.git = {
    enable = true;
    user.name = "Kaif Ahmed";
    user.email = gitEmail;

    extraConfig = {
      url = {
        "ssh://git@github.com/" = {
          insteadOf = "https://github.com/";
        };
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
}
