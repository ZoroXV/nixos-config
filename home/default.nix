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
      discord
    ];
  };

  programs = import ./programs { inherit pkgs; };

  services = import ./services { inherit pkgs; };
}
