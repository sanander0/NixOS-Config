{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    # Other
    mako
    xwayland-satellite
    gruvbox-gtk-theme
  ];

}
