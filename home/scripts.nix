{ pkgs, lib, ... }:

let
	scriptsDir = ../scripts;

	# Every *.sh file in ../scripts becomes a shell application on $PATH,
	# named after the file (minus the .sh extension). writeShellApplication
	# runs shellcheck at build time, so scripts must pass shellcheck.
	scriptFiles = builtins.attrNames (lib.filterAttrs
		(name: type: type == "regular" && lib.hasSuffix ".sh" name)
		(builtins.readDir scriptsDir));

	mkScript = fileName: pkgs.writeShellApplication {
		name = lib.removeSuffix ".sh" fileName;
		text = builtins.readFile (scriptsDir + "/${fileName}");
	};
in
{
	home.packages = map mkScript scriptFiles;
}
