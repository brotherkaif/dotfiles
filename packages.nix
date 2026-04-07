# packages.nix
# ─────────────────────────────────────────────────────────────
# Centralised package definitions for all systems.
# This is the single place to add, remove, or modify packages.
#
# Sections:
#		- darwin.systemPackages : Nix packages for macOS system environment
#		- home.packages					: Nix packages for home-manager (all platforms)
#		- homebrew.taps					: Homebrew taps (macOS)
#		- homebrew.brews				: Homebrew formulae (macOS)
#		- homebrew.casks				: Homebrew casks (macOS)
#		- homebrew.masApps			: Mac App Store apps (macOS)
#		- fonts									: Font packages (macOS)
#
# The isPersonal flag controls work vs personal machine installs.
# Platform-specific filtering (Linux-only, etc.) is handled via stdenv.
# ─────────────────────────────────────────────────────────────

{ pkgs, lib, isPersonal }:

{
	# Darwin System Packages (environment.systemPackages)
	darwin.systemPackages = with pkgs; [
		git
		vim
	];

	# Home Manager Packages (home.packages, all platforms)
	home.packages = with pkgs; [
		# Shared (work + personal, all platforms)
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
	] ++ lib.optionals (!pkgs.stdenv.isDarwin) [
		crush
	] ++ lib.optionals isPersonal [
		# Personal only
		hugo
		nodejs_24
		zellij
	] ++ lib.optionals pkgs.stdenv.isLinux [
		# Linux only
		ffmpeg
		gnome-feeds
		mixxx
		ollama
		proton-pass
		protonmail-desktop
		protonvpn-gui
	];

	# Homebrew Taps
	homebrew.taps = [
		"charmbracelet/tap/crush"
	];

	# Homebrew Formulae
	homebrew.brews = [
		# Shared (work + personal)
	] ++ lib.optionals isPersonal [
		"ffmpeg"
		"gemini-cli"
	];

	# Homebrew Casks
	homebrew.casks = [
		# Shared (work + personal)
		"ollama"
	] ++ lib.optionals (!isPersonal) [
		# Work only
		"visual-studio-code"
	] ++ lib.optionals isPersonal [
		# Personal only
		"appcleaner"
		"audacity"
		"kid3"
		"netnewswire"
		"proton-drive"
		"proton-mail"
		"proton-pass"
		"protonvpn"
		"steam"
	];

	# Mac App Store
	homebrew.masApps = {
		# Shared (work + personal)
	} // lib.optionalAttrs isPersonal {
		# Personal only
		"Ghostery" = 6504861501;
		"JSON Peep for Safari" = 1458969831;
		"Proton Pass for Safari" = 6502835663;
		"djay - DJ App & AI Mixer" = 450527929;
	};

	# Fonts (macOS)
	fonts = with pkgs; [
		nerd-fonts._0xproto
	];
}
