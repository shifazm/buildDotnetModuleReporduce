# Reproduction for https://github.com/NixOS/nixpkgs/issues/220985
1. Clone and run `nix build && nix log` to to observe NETSDK1194
2. Go to `flake.nix` and uncomment `nixpkgs.url`
3. Run  `nix build && nix log` again to see error gone
