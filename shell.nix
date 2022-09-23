# latest commit from `nixos-unstable` at 2021-11-18 to support M1 Macs
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/931ab058daa7e4cd539533963f95e2bb0dbd41e6.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = let
    node = pkgs.nodejs-14_x;
    ruby = pkgs.ruby;
  in [
    node
    ruby
  ];
}
