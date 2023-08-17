{ pkgs, ... }:
{
  # Core
  home-manager.enable = true;
  command-not-found.enable = true;

  # Users Programs
  git = import ./git.nix {};
  zsh = import ./zsh {};
  alacritty.enable = true;
}
