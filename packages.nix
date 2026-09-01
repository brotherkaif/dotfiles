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

let
	proton-drive-cli = pkgs.callPackage ./pkgs/proton-drive-cli.nix { };

# Mixo - audio mixer application (version 2.2.0, same on all personal machines)
	mixoMac = if pkgs.stdenv.isDarwin then
		pkgs.stdenv.mkDerivation rec {
			pname = "mixo";
			version = "2.2.0";

			src = pkgs.fetchurl {
				url = "https://www.mixo.dj/download/MIXO-${version}.dmg";
				sha256 = "03ri19m6daxfd4qsjqrwwjh3i4jpd9scmj11y4s8a4j1p9p72fnm";
			};

			nativeBuildInputs = [ pkgs.undmg ];
			sourceRoot = ".";
			installPhase = ''
				mkdir -p "$out/Applications"
				cp -R "MIXO.app" "$out/Applications/"
			';
		}
	else
		pkgs.appimageTools.wrapType2 rec {
			pname = "mixo";
			version = "2.2.0";

			src = pkgs.fetchurl {
				url = "https://www.mixo.dj/download/MIXO-2.2.0.AppImage";
				sha256 = "sha256-HTfVkLFYDTgT/TJjB1xbNd/rzKNoLMJnoYwHZKNw7vc=";
			};

			# Mixo relies on this older OpenSSL library to launch successfully
			extraPkgs = p: with p; [ openssl_1_1 ];

			# Grab the .DirIcon from the extracted contents and install it to your system icons
			extraInstallCommands = ''
			install -m 444 -D $out/share/icons/hicolor/512x512/apps/mixo.png
		';
		};

in
{
	# Darwin System Packages (environment.systemPackages)
	darwin.systemPackages = with pkgs; [
		git
		vim
		mixoMac
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
		zellij
	] ++ lib.optionals (!pkgs.stdenv.isDarwin) [
	] ++ lib.optionals isPersonal [
		# Personal only
		ffmpeg
		hugo
		nodejs_24
		opencode
		proton-drive-cli
		yt-dlp
	] ++ lib.optionals pkgs.stdenv.isLinux [
		# Linux only
		ffmpeg

		mixxx
		ollama
		proton-pass
		protonmail-desktop
		protonvpn-gui
	];

	# Homebrew Taps
	homebrew.taps = [
	];

	# Homebrew Formulae
	homebrew.brews = [
		# Shared (work + personal)
	] ++ lib.optionals (!isPersonal) [
		# Work only
	] ++ lib.optionals isPersonal [
		# Personal only
	];

	# Homebrew Casks
	homebrew.casks = [
		# Shared (work + personal)
		"ollama"
	] ++ lib.optionals (!isPersonal) [
		# Work only
		"copilot-cli"
		"visual-studio-code"
	] ++ lib.optionals isPersonal [
		# Personal only
		"antigravity-cli"
		"appcleaner"
		"audacity"
		"kid3"
		"netnewswire"
		"proton-drive"
		"proton-mail"
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
		"ReDD Focus for Safari" = 1660218371;
	};

	# Fonts (macOS)
	fonts = with pkgs; [
		nerd-fonts._0xproto
	];
}
