{
  description = "Shared nvf (neovim) configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    flake-parts,
    nvf,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

      flake = {
        nvfModules.default = ./modules/nvf.nix;
        nixosModules.default = ./modules/nvf.nix;
        darwinModules.default = ./modules/nvf.nix;
        homeManagerModules.default = ./modules/nvf.nix;
      };

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;

        packages.default =
          (nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [
              ({lib, ...}: {
                vim = lib.mkMerge (
                  map (p: import p {inherit lib pkgs;})
                  (import ./modules/parts/list.nix)
                );
              })
            ];
          }).neovim;
      };
    };
}
