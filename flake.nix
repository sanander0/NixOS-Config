{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixos-pc = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { inherit inputs; };  # ← inputs теперь доступен в модулях

        modules = [
          ./user.nix

          ./nixos/configuration.nix
          ./nixos/hardware-configuration.nix
          ./nixos/packages.nix
          ./nixos/KernelMod.nix

          ./services/pipewire.nix
          ./services/greetd.nix
          ./services/V2rayA.nix
	        ./services/ssh.nix
	        ./services/firewall.nix
	        ./services/network.nix
          ./services/flash.nix
          
          ./scripts/wallpaper.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sanander = import ./home/home.nix;
          }
        ];
      };
    };
  };
}
