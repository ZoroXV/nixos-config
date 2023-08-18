{ pkgs, ... }:
{
  picom.enable = true;

  polybar = import ./polybar { inherit pkgs; };
}
