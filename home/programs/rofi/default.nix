{ pkgs, ... }:
{
  enable = true;

  theme = ./theme.rasi;

  package = pkgs.rofi.override {
    plugins = [
      pkgs.rofi-emoji
      pkgs.rofi-calc
    ];
  };
}
