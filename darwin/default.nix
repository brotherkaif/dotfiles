{ pkgs, user, lib, isPersonal, ... }:

let
	packages = import ../packages.nix { inherit pkgs lib isPersonal; };
in
{
	users.users.${user} = {
		name = "${user}";
		home = "/Users/${user}";
	};

	system.primaryUser = "${user}";

	environment.systemPackages = packages.darwin.systemPackages;
	environment.systemPath = [ "/opt/homebrew/bin" ];

	homebrew = {
		enable = true;

		onActivation.autoUpdate = true;
		onActivation.upgrade = true;

		taps = packages.homebrew.taps;
		brews = packages.homebrew.brews;
		casks = packages.homebrew.casks;
		masApps = packages.homebrew.masApps;
	};

	fonts.packages = packages.fonts;

	# Nix Configuration
	nix.enable = false;
	nixpkgs.config.allowUnfree = true;

	# Enable Zsh (required for MacOS to not complain, even if you use Fish/Bash)
	programs.zsh.enable = true;

	system.stateVersion = 6;
	nixpkgs.hostPlatform = "aarch64-darwin";
}
