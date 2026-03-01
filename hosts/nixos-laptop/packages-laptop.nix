{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    wayfire
    xwayland
    magnetic-catppuccin-gtk
    brightnessctl
    imagemagick
    grim
    slurp
  ];



}
