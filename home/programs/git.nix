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
      signingkey = "017FE45EB1B1D768AFC3FA0E4D7E5D00DAC2AEF8";
    };

    color = {
      ui = true;
      branch = "auto";
      diff = "auto";
      interactive = "auto";
      status = "auto";
    };

    commit = {
      gpgsign = true;
      verbose = true;
    };

    branch = {
      autosetuprebase = "always";
    };

    rebase = {
      autoSquash = true;
      autoStash = true;
    };

    push = {
      default = "simple";
      autoSetupRemote = true;
    };

    init = {
      defaultBranch = "main";
    };
  };
}
