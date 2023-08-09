{
  description = "A very basic flake";

  inputs = {
    # nixpkgs = {
    #   type = "github";
    #   owner = "NixOs";
    #   repo = "nixpkgs";
    #   ref = "nixos-23.05";
    # };

    # home-manager = {
    #   type = "github";
    #   owner = "nix-community";
    #   repo = "home-manager";
    #   ref = "release-23.05";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
  };

  # outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  #   let
  #     system = "x86_64-linux";
  #     pkgs = import nixpkgs {
  #       inherit system;
  #       config.allowUnfree = true;
  #     };
  #     lib = nixpkgs.lib;
  #   in {
  #     nixosConfigurations = {
  #       zenbook = lib.nixosSystem {
  #         inherit system;
  #         modules = [
  #           ./configuration.nix
  #           home-manager.nixosModules.home-manager
  #           {
  #             home-manager.useGlobalPkgs = true;
  #             home-manager.useUserPackages = true;
  #             home-manager.users.zor0 = import ./home;
  #           }
  #         ];
  #       };
  #     };
  #   };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: {
    nixosModules = {
      home = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.zor0 = import ./home;
        home-manager.verbose = true;
      };
    };

    nixosConfigurations =
      let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
      in {
        zenbook = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/zenbook
            home-manager.nixosModule
          ];
        };
      };
  };
}
