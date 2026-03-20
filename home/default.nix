{ config, pkgs, lib, user, isPersonal, ... }:

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

	home.packages = with pkgs; [
		(python3.withPackages (ps: with ps; [ pip ]))
		bat
		clang-tools
		dust
		fastfetch
		fx
		fzf
		gh
		go
		gopls
		jq
		lazygit
		lua-language-server
		nodePackages.eslint
		nodePackages.typescript-language-server
		stow
		tree
		vscode-langservers-extracted
		wget
	] ++ lib.optionals (isPersonal) [
		hugo
		nodejs_24
		zellij
	] ++ lib.optionals (pkgs.stdenv.isLinux) [
		ffmpeg
		gnome-feeds
		mixxx
		proton-pass
		protonmail-desktop
		protonvpn-gui
	];

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	programs.home-manager.enable = true;
}
