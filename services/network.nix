{ config, lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  services.resolved.enable = true;
}
