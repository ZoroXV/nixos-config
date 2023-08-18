{ pkgs, ... }:
{
  enable = true;

  plugins = with pkgs.vimPlugins; [
    lightline-vim
    rust-vim
    vim-nix
    catppuccin-vim
  ];

  settings = {
    number = true;
    expandtab = true;
    ignorecase = true;
    shiftwidth = 4;
    tabstop = 8;
  };

  extraConfig = builtins.readFile ./vimrc;
}
