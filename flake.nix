{
  description = ''
    jirwin's flake templates

    Use `nix flake new -t github:jirwin/flake-templates#language` to use the template.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: rec {
    templates = {
      blank = {
        path = ./blank;
        description = "Base template";
      };

      go = {
        path = ./go;
        description = "Golang template";
      };

      python = {
        path = ./python;
        description = "Python template";
      };

      defaultTemplate = templates.blake;
    };
  };
}
