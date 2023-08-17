{ config, lib, pkgs, ... }:
{
  users.mutableUsers = true;
  users.users.zor0 = {
    isNormalUser = true;
    home = "/home/zor0";
    shell = pkgs.zsh;
    uid = 4242;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
