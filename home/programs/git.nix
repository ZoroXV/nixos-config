{ ... }:
{
  enable = true;

  userName = "Zor0";
  userEmail = "zor0_mugiwara" + "@" + "proton.me";

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
    user = {
      signingkey = "7FF3C3F65700E2E3";
    };

    commit = {
      gpgsign = true;
      verbose = true;
    };

    init = {
      defaultBranch = "master";
    };
  };
}
