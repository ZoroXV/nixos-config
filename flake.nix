{
  description = "Zor0's Custom NixOS Configuration";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOs";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      ref = "master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
      ref = "main";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: {
    nixosModules = {
      home = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.zor0 = import ./home;
        home-manager.verbose = true;
      };
      nix-path = {
        nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      };
    };

    nixosConfigurations =
      let
        system = "x86_64-linux";
        sharedModules = [
          home-manager.nixosModule
          ./base
        ] ++ (nixpkgs.lib.attrValues self.nixosModules);
      in {
        zenbook = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/zenbook
          ] ++ sharedModules;
        };
      };
  };
}
