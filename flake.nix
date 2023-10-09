{
  description = "Flake for tauri-nativify";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
        };
        ##gui version
        _nativify = pkgs.callPackage ./default.nix {};
      in rec {
        # For `nix build` & `nix run`:
        packages = rec {
          nativify = pkgs.callPackage ./default.nix {};
          default = nativify;
        };        
        # For `nix develop`:
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [ rustc cargo openssl libsoup ];
        };
      }
    );
}