{ config, pkgs, lib, ... }:

{
  home.activation.installMlxLm = lib.mkIf pkgs.stdenv.isDarwin (
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d "$HOME/.local/share/mlx-venv" ]; then
        ${pkgs.python3}/bin/python3 -m venv "$HOME/.local/share/mlx-venv"
      fi
      "$HOME/.local/share/mlx-venv/bin/pip" install --quiet --upgrade mlx-lm
    ''
  );

  home.sessionPath = lib.mkIf pkgs.stdenv.isDarwin [
    "$HOME/.local/share/mlx-venv/bin"
  ];
}
