{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    river-classic
    xwayland
    magnetic-catppuccin-gtk
    brightnessctl
    imagemagick
    grim
    slurp
  ];



}
