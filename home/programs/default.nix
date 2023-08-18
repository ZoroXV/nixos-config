{ pkgs, ... }:
{
  # Core
  home-manager.enable = true;
  command-not-found.enable = true;

  alacritty = import ./alacritty.nix {};

  git = import ./git.nix {};

  rofi = import ./rofi { inherit pkgs; };

  vim = import ./vim { inherit pkgs; };

  zsh = import ./zsh { inherit pkgs; };
}
