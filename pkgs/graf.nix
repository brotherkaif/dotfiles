# graf: terminal-based force-directed graph visualizer for markdown wikilinks
# https://github.com/reekta92/graf
# Not packaged in nixpkgs/Homebrew/crates.io, so we build it from source.
{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
	pname = "graf";
	version = "0.4.16";

	src = fetchFromGitHub {
		owner = "reekta92";
		repo = "graf";
		tag = "v${version}";
		hash = "sha256-c1lcOLUSo3u3rNcqbXD2hHQyTRpboKkG4aXN4gRk8rE=";
	};

	cargoHash = "sha256-9SBD3oAyeMMNSwe1H3jgUAswa6Rz11EX6oQsrNoI5vs=";

	meta = {
		description = "Terminal-based force-directed graph visualizer for markdown wikilinks";
		homepage = "https://github.com/reekta92/graf";
		license = lib.licenses.gpl3Only;
		mainProgram = "graf";
	};
}
