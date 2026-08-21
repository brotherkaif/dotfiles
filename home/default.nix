{ config, pkgs, lib, user, isPersonal, isSteamOS ? false, plasma-manager, ... }:

let
	packages = import ../packages.nix { inherit pkgs lib isPersonal; };
in
{
	imports = [
		./git.nix
		./kde.nix
		./nvim.nix
		./scripts.nix
		./shell.nix
		./tmux.nix
	] ++ lib.optionals (plasma-manager != null) [
		plasma-manager.homeModules.plasma-manager
		./plasma.nix
	] ++ lib.optionals isPersonal [
		./opencode.nix
		./mlx.nix
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
