{ ... }:
{
  enable = true;

  userName = "Victor LE CORRE";
  userEmail = "victor.le-corre" + "@" + "epita.fr";

  aliases = {
    s = "status";
  };

  ignores = [ "*~" "*.swp" ".o" ".d" ];

  extraConfig = {
    commit = {
      verbose = true;
    };
  };
}
