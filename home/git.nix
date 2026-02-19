{ config, pkgs, gitEmail, ... }:

{
  programs.git = {
    enable = true;
    userName = "Kaif Ahmed";
    userEmail = gitEmail;

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
