{ ... }:
{
  enable = true;

  userName = "Victor LE CORRE";
  userEmail = "victor.le-corre" + "@" + "epita.fr";

  lfs.enable = true;

  aliases = {
    c = "commit";
    s = "status";
    co = "checkout";
    cob = "checkout -b";
    b = "branch";
    f = "fetch";
    pl = "pull";
    ph = "push";
    l = "log --oneline --graph";
    ll = "log --graph";
    ls = "log --stat";
    lp = "log -p";
    nb = "shortlog -sn";
    rb = "rebase";
    m = "merge";
    r = "remote";
  };

  ignores = [ "*~" "*.swp" ".o" ".d" ];

  extraConfig = {
    commit = {
      verbose = true;
    };

    init = {
      defaultBranch = "master";
    };
  };
}
