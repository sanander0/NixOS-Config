{ config, pkgs, ... }:

{
  home.stateVersion = "26.05";

  imports = [
    ./modules/river.nix
    ./modules/alacritty.nix
    ./modules/waybar.nix
    ./modules/bash.nix
    ./modules/fastfetch.nix
    ./modules/wofi.nix
    ./modules/mako.nix
    ./modules/nvim.nix
    ./modules/Rscripts.nix
  ];
}
