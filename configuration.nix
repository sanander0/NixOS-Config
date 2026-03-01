{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  networking.firewall.enable = false;

  system.stateVersion = "25.11"; # Did you read the comment?



  nix.gc.automatic = true;
  nix.gc.dates = "daily"; 
  nix.gc.options = "--delete-older-than 3d";

  nix.optimise.automatic = true;
  nix.optimise.dates = [ "dayly" ];

}

