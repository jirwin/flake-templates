{ lib
, llvmPackages_18
, cmake
, spdlog
, abseil-cpp }:

llvmPackages_18.stdenv.mkDerivation rec {
  pname = "cpp-template";
  version = "0.1.0";

  src = ./.;

  nativeBuildInputs = [ cmake ];
  buildInputs = [ spdlog abseil-cpp ];

  cmakeFlags = [
    "-DENABLE_TESTING=OFF"
    "-DENABLE_INSTALL=ON"
  ];

  meta = with lib; {
    homepage = "https://github.com/jirwin/flake-templates";
    description = ''
      A template for Nix based C++ project setup.";
    '';
    licencse = licenses.mit;
    platforms = with platforms; linux ++ darwin;
  };
}
