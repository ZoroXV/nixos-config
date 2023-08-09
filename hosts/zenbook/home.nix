{ config, lib, pkgs, ... }:

{
  home-manager.users.zor0 = {
    home = {
      stateVersion = "23.05";
      username = "zor0";
      homeDirectory = "/home/zor0";

      packages = with pkgs; [
        firefox
        htop
      ];
    };

    programs.home-manager.enable = true;
  };
}
