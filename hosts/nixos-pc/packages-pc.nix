{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    # Other
    xwayland-satellite
    gruvbox-gtk-theme
  ];

}
