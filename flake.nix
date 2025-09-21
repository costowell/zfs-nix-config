{
  description = "ZFS NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs { inherit system; };
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      reef = nixpkgs.lib.nixosSystem {
        modules = [./hosts/reef];
      };
    };
  };
}
