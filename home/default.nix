{ config, lib, pkgs, ... }:
{
  #xsession.windowManager.i3.enable = true;

  home = {
    stateVersion = "23.05";

    username = "zor0";
    homeDirectory = "/home/zor0";

    packages = with pkgs; [
      firefox
      neofetch
    ];
  };

  programs = import ./programs { inherit pkgs; };
}
