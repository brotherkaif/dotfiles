{
  description = "Brother Kaif nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    username = "kaifahmed";
  in
  {
    darwinConfigurations."mini" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        # 1. The MacOS System Config
        ./darwin/default.nix

        # 2. The Home Manager Module
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./home/default.nix;
        }
      ];
    };
  };
}
