{ config, pkgs, ... }:

{
  users.users.sanander = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "networkmanager" ];
  };
}
