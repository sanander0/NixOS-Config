{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos-pc"; 

  system.stateVersion = "25.11"; # Did you read the comment?
}
