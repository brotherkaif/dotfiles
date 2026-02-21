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
      isPersonal = true;
    };

    macbook-air-config = {
      system = "aarch64-darwin";
      username = "kaifahmed";
      gitEmail = "github.banister767@passinbox.com";
      isPersonal = true;
    };

    macbook-pro-config = {
      system = "aarch64-darwin";
      username = "ahmedk02";
      gitEmail = "kaif.ahmed@bbc.co.uk";
      isPersonal = false;
    };

    thinkcentre-config = {
      system = "x86_64-linux";
      username = "brotherkaif";
      gitEmail = "github.banister767@passinbox.com";
      isPersonal = true;
    };

    thinkpad-config = {
      system = "x86_64-linux";
      username = "brotherkaif";
      gitEmail = "github.banister767@passinbox.com";
      isPersonal = true;
    };
  in
  {
    darwinConfigurations = {
      "mac-mini" = nix-darwin.lib.darwinSystem {
        system = mac-mini-config.system;
        specialArgs = {
          user = mac-mini-config.username;
          isPersonal = mac-mini-config.isPersonal;
        };
        modules = [
          ./darwin/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              user = mac-mini-config.username;
              gitEmail = mac-mini-config.gitEmail;
              isPersonal = mac-mini-config.isPersonal;
            };

            home-manager.users.${mac-mini-config.username} = import ./home/default.nix;
          }
        ];
      };

      "macbook-air" = nix-darwin.lib.darwinSystem {
        system = macbook-air-config.system;
        specialArgs = {
          user = macbook-air-config.username;
          isPersonal = macbook-air-config.isPersonal;
        };
        modules = [
          ./darwin/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              user = macbook-air-config.username;
              gitEmail = macbook-air-config.gitEmail;
              isPersonal = macbook-air-config.isPersonal;
            };

            home-manager.users.${macbook-air-config.username} = import ./home/default.nix;
          }
        ];
      };

      "macbook-pro" = nix-darwin.lib.darwinSystem {
        system = macbook-pro-config.system;
        specialArgs = {
          user = macbook-pro-config.username;
          isPersonal = macbook-pro-config.isPersonal;
        };
        modules = [
          ./darwin/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              user = macbook-pro-config.username;
              gitEmail = macbook-pro-config.gitEmail;
              isPersonal = macbook-pro-config.isPersonal;
            };

            home-manager.users.${macbook-pro-config.username} = import ./home/default.nix;
          }
        ];
      };
    };

    nixosConfigurations = {
      "thinkcentre" = nixpkgs.lib.nixosSystem {
        system = thinkcentre-config.system;
        specialArgs = { user = thinkcentre-config.username; };
        modules = [
          ./nixos/configuration.nix
          ./nixos/hosts/thinkcentre/hardware-configuration.nix

          ./nixos/steam.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              user = thinkcentre-config.username;
              gitEmail = thinkcentre-config.gitEmail;
              isPersonal = thinkcentre-config.isPersonal;
            };
            home-manager.users.${thinkcentre-config.username} = import ./home/default.nix;
          }
        ];
      };
    };

    nixosConfigurations = {
      "thinkpad" = nixpkgs.lib.nixosSystem {
        system = thinkpad-config.system;
        specialArgs = { user = thinkpad-config.username; };
        modules = [
          ./nixos/configuration.nix
          ./nixos/hosts/thinkpad/hardware-configuration.nix

          ./nixos/steam.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              user = thinkpad-config.username;
              gitEmail = thinkpad-config.gitEmail;
              isPersonal = thinkpad-config.isPersonal;
            };
            home-manager.users.${thinkpad-config.username} = import ./home/default.nix;
          }
        ];
      };
    };
  };
}
