{
  description = "A very basic flake";
  inputs = {
    # using this master run "nix build && nix log" to observe NETSDK1194
    nixpkgs.url = "github:NixOS/nixpkgs";
    # this commit fixes it 
    # nixpkgs.url = "github:NixOS/nixpkgs?rev=72970f09d7c25e6b5966500deb163aa7356d78eb";

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
