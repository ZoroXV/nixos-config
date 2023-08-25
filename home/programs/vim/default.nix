{ pkgs, ... }:
{
  enable = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    lightline-vim

    # Syntax Highlights
    rust-vim
    vim-nix
    vim-go

    # Color Schemes
    catppuccin-vim
    nightfox-nvim
  ];

  # settings = {
  #   number = true;
  #   expandtab = true;
  #   ignorecase = true;
  #   shiftwidth = 4;
  #   tabstop = 8;
  # };

  extraConfig = builtins.readFile ./vimrc;
}
