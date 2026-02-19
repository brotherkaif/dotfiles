{
  description = "Brother Kaif multi-system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    mac-mini-config = {
      system = "aarch64-darwin";
      username = "kaifahmed";
      gitEmail = "github.banister767@passinbox.com";
    };

    macbook-air-config = {
      system = "aarch64-darwin";
      username = "kaifahmed";
      gitEmail = "github.banister767@passinbox.com";
    };

    macbook-pro-config = {
      system = "aarch64-darwin";
      username = "ahmedk02";
      gitEmail = "kaif.ahmed@bbc.co.uk";
    };
  in
  {
    darwinConfigurations = {
      "mac-mini" = nix-darwin.lib.darwinSystem {
        system = mac-mini-config.system;
        specialArgs = { user = mac-mini-config.username; };
        modules = [
          ./darwin/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              user = mini-config.username;
              gitEmail = mini-config.gitEmail;
            };

            home-manager.users.${mac-mini-config.username} = import ./home/default.nix;
          }
        ];
      };

      "macbook-air" = nix-darwin.lib.darwinSystem {
        system = macbook-air-config.system;
        specialArgs = { user = macbook-air-config.username; };
        modules = [
          ./darwin/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              user = mini-config.username;
              gitEmail = mini-config.gitEmail;
            };

            home-manager.users.${macbook-air-config.username} = import ./home/default.nix;
          }
        ];
      };

      "macbook-pro" = nix-darwin.lib.darwinSystem {
        system = macbook-pro-config.system;
        specialArgs = { user = macbook-pro-config.username; };
        modules = [
          ./darwin/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              user = mini-config.username;
              gitEmail = mini-config.gitEmail;
            };

            home-manager.users.${macbook-pro-config.username} = import ./home/default.nix;
          }
        ];
      };
    };
  };
}
