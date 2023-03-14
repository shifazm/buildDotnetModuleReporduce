{
  description = "A very basic flake";
  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          packages.default = pkgs.callPackage ./src { dotnet-sdk = pkgs.dotnet-sdk_7; };
          devShells.default = pkgs.callPackage ./shell.nix {  };
        }
      );
}
