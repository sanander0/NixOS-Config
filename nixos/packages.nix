{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.niri.enable = true;
  programs.steam.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    firefox
    alacritty
    telegram-desktop
    discord
    

    # CLI utils
    fastfetch
    neovim
    git
    btop
    cmus
    cava
    yt-dlp

    # GUI utils
    nemo
    pavucontrol
    nwg-look
    droidcam

    # WMs stuff
    waybar
    wofi
    swww
    mako


    # Other
    home-manager
    xwayland-satellite
    gruvbox-gtk-theme
  ];

  fonts.packages = with pkgs; [
    #jetbrains-mono
    noto-fonts
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.jetbrains-mono
  ];
}
