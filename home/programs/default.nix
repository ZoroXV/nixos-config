{ pkgs, ... }:
{
  # Core
  home-manager.enable = true;
  command-not-found.enable = true;

  # Users Programs
  git = import ./git.nix {};
  alacritty.enable = true;
}
