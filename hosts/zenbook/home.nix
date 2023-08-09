{ config, lib, pkgs, ... }:

{
  home-manager.users.zor0 = {
    home = {
      stateVersion = "23.05";
      username = "zor0";
      homeDirectory = "/home/zor0";

      packages = with pkgs; [
        firefox
      ];
    };

    programs.home-manager.enable = true;
  };
}
