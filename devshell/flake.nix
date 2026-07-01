{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    git-hooks,
    ...
  }: let
    eachSystem = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
  in {
    checks = eachSystem (system: {
      pre-commit-check = git-hooks.lib.${system}.run {
        src = ../.;
        hooks = {
          alejandra.enable = true;
          deadnix.enable = true;
          statix.enable = true;
        };
      };
    });

    devShells = eachSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        inherit (self.checks.${system}.pre-commit-check) shellHook;
        buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;
      };
    });
  };
}
