{ config, pkgs, lib, user, isPersonal, ... }:

let
	packages = import ../packages.nix { inherit pkgs lib isPersonal; };
in
{
	imports = [
		./git.nix
		./nvim.nix
		./shell.nix
		./tmux.nix
	] ++ lib.optionals (!isPersonal) [
		./fnm.nix
	];

	home.username = "${user}";
	home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${user}" else "/home/${user}";

	home.stateVersion = "24.05";

	home.packages = packages.home.packages;

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	programs.home-manager.enable = true;
}
