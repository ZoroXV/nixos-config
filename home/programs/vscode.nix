{ pkgs }:
{
  enable = true;

  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix

    rust-lang.rust-analyzer
    serayuzgur.crates
    tamasfe.even-better-toml
  ];
}
