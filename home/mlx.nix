{ config, pkgs, lib, ... }:

{
  home.activation.installMlxLm = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/.local/share/mlx-venv" ]; then
      ${pkgs.python3}/bin/python3 -m venv "$HOME/.local/share/mlx-venv"
    fi
    "$HOME/.local/share/mlx-venv/bin/pip" install --quiet --upgrade mlx-lm
  '';

  home.sessionPath = [ "$HOME/.local/share/mlx-venv/bin" ];
}
