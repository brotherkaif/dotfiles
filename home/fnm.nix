{ config, pkgs, ... }:

{
  home.packages = [ pkgs.fnm ];

  programs.bash.bashrcExtra = ''
    eval "$(fnm env --use-on-cd)"
  '';

  programs.zsh.initContent = ''
    eval "$(fnm env --use-on-cd)"
  '';
}
