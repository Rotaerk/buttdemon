{
  description = "A haskell binding to assimp.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      ldLibraryPath = pkgs.lib.makeLibraryPath [
        pkgs.assimp
      ];
      hs = pkgs.haskellPackages;
      buttdemon = hs.callCabal2nix "buttdemon" ./buttdemon { inherit (pkgs) assimp; };
    in {
      inherit pkgs buttdemon;
      packages.x86_64-linux = {
        default = hs.shellFor {
          packages = p: [ buttdemon ];
          nativeBuildInputs = [
            hs.cabal-install
          ];
        };
      };

    };
}
