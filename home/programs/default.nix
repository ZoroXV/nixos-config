{ pkgs, ... }:
{
  # Core
  home-manager.enable = true;
  command-not-found.enable = true;

  alacritty = import ./alacritty.nix {};

  git = import ./git.nix {};

  rofi = import ./rofi { inherit pkgs; };

  zsh = import ./zsh { inherit pkgs; };
}
