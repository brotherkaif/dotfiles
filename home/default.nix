{ config, pkgs, user, ... }:

{
  imports = [
    ./fnm.nix
    ./git.nix
    ./nvim.nix
    ./shell.nix
  ];

  home.username = "${user}";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${user}" else "/home/${user}";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [ pip ]))
    bat
    chezmoi
    dust
    fastfetch
    ffmpeg
    fx
    fzf
    gh
    go
    jq
    lazygit
    stow
    tree
    wget
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
