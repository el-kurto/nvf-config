# nvf-config

Shared [nvf](https://github.com/notashelf/nvf) (neovim) configuration.

## Usage

Add the flake as an input, following the host's `nixpkgs` and `nvf`:

```nix
# flake.nix inputs
nvf.url = "github:notashelf/nvf";
nvf.inputs.nixpkgs.follows = "nixpkgs";

nvf-config.url = "github:el-kurto/nvf-config";
nvf-config.inputs.nixpkgs.follows = "nixpkgs";
nvf-config.inputs.nvf.follows = "nvf";
```

Import the module wherever the nvf module is loaded (system or home-manager):

```nix
imports = [
  inputs.nvf.homeManagerModules.default        # or nixosModules / darwinModules
  inputs.nvf-config.nvfModules.default
];
```

Theming is host-owned. The module sets no colors or `theme.enable`; layer those
in alongside the import via `programs.nvf.settings.vim = lib.mkMerge [ ... ]`.

## Structure

```
flake.nix              # inputs (nixpkgs, nvf) + module exports
modules/nvf.nix        # enables nvf, merges parts into settings.vim
modules/parts/         # one file per concern
```
