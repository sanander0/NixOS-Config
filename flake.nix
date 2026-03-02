{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    commonModules = [
      ./user.nix
      ./packages.nix
      ./hardware-configuration.nix
      ./configuration.nix

      ./services/pipewire.nix
      ./services/V2rayA.nix
      ./services/ssh.nix
      ./services/firewall.nix
      ./services/network.nix
      ./services/flash.nix
      ./services/polkit.nix

    ];
  in {
    nixosConfigurations = {
      nixos-pc = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = commonModules ++ [
          ./nixos/KernelMod.nix

          ./hosts/nixos-pc/nixos-pc.nix
          ./hosts/nixos-pc/packages-pc.nix

          ./hosts/nixos-pc/services/greetd.nix

          ./hosts/nixos-pc/scripts/wallpaper.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sanander = import ./hosts/nixos-pc/home/home.nix;
          }
        ];
      };

      nixos-laptop = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = commonModules ++ [
          ./hosts/nixos-laptop/nixos-laptop.nix
          ./hosts/nixos-laptop/packages-laptop.nix

          ./hosts/nixos-laptop/services/greetd.nix
          ./hosts/nixos-laptop/services/libinput.nix
          ./hosts/nixos-laptop/services/xdg.nix

          ./hosts/nixos-laptop/scripts/wallpaper.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sanander = import ./hosts/nixos-laptop/home/home.nix;
          }
        ];
      };
    };
  };
}

