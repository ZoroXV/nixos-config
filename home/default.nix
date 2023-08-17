{ config, lib, pkgs, ... }:
{
  xsession.windowManager.i3 = import programs/i3 { inherit pkgs lib; };

  home = {
    stateVersion = "23.05";

    username = "zor0";
    homeDirectory = "/home/zor0";

    packages = with pkgs; [
      feh
      firefox
      neofetch
    ];
  };

  programs = import ./programs { inherit pkgs; };

  services.picom.enable = true;
}
