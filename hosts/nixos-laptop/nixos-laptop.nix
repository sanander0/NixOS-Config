{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos-laptop";

  system.stateVersion = "25.11"; # Did you read the comment?
}
