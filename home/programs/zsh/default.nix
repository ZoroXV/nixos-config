{ pkgs, ... }:
let
  homeDirectory = "/home/zor0";
  username = "zor0";
  p10k = ./p10k.zsh;
in {
  enable = true;
  initExtra = ''
    if [[ -r "${homeDirectory}/.cache/p10k-instant-prompt-${username}.zsh" ]]; then
      source "${homeDirectory}/.cache/p10k-instant-prompt-${username}.zsh"
    fi

    # neofetch

    [[ ! -f ${p10k} ]] || source ${p10k}
  '';

  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
  ];

  oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "sudo"
    ];
  };
}
