{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  programs.waybar.enable = true;
  programs.steam.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    firefox
    alacritty
    telegram-desktop
    obsidian
    obs-studio
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
    transmission_4-gtk
    mpv
    imv
    localsend

    # WMs stuff
    wofi
    swww

    # Other
    wl-clipboard
    home-manager
    adwaita-icon-theme
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
