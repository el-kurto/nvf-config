{
  lib,
  pkgs,
  config,
  ...
}: let
  parts = [
    ./parts/options.nix
    ./parts/bufferline.nix
    ./parts/neo-tree.nix
    ./parts/fzf-lua.nix
    ./parts/git.nix
    ./parts/lualine.nix
    ./parts/noice.nix
    ./parts/indent-blankline.nix
    ./parts/blink-cmp.nix
    ./parts/conform.nix
    ./parts/trouble.nix
    ./parts/todo-comments.nix
    ./parts/which-key.nix
    ./parts/autopairs.nix
    ./parts/mini-surround.nix
    ./parts/lsp/lsp.nix
    ./parts/lsp/languages.nix
  ];
in {
  programs.nvf = {
    enable = true;
    settings.vim = lib.mkMerge (map (p: import p {inherit lib pkgs config;}) parts);
  };
}
