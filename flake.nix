{
  description = "Shared nvf (neovim) configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nvf,
    ...
  }: {
    nvfModules.default = ./modules/nvf.nix;
    nixosModules.default = ./modules/nvf.nix;
    darwinModules.default = ./modules/nvf.nix;
    homeManagerModules.default = ./modules/nvf.nix;
  };
}
