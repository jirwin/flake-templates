{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:

  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      config.allowUnfree = true;
    in {
      devShell = with pkgs; mkShell rec {
        name = "cpp";
        packages = with pkgs; [
          llvmPackages_18.clang
          cmake
          cmakeCurses
          gtest
          spdlog
          abseil-cpp
        ];

        shellHook = let
          icon = "f121";
          in ''
            export PS1="$(echo -e '\u${icon}') {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} (${name}) \\$ \[$(tput sgr0)\]"
          '';
      };

      packages.default = pkgs.callPackage ./default.nix {};
    });
}
