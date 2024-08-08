{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, }:

  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    rec {
      devShell = pkgs.mkShellNoCC {
        name = "go";

        buildInputs = with pkgs; [
          go
          gopls
          gotools
          go-outline
          gopkgs
          gocode-gomod
          godef
          golint
          just
        ];
      };

      packages.app = pkgs.buildGoModule {
        pname = "app";
        version = "0.0.1";
        src = ./.;
        vendorSha256 = "";
      };

      defaultPackage = packages.app;
    }
  );
}
