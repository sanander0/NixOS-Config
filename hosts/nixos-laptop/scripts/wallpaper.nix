{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
  ];

  system.activationScripts.downloadWallpaper.text = ''
    WALLDIR="/home/sanander/Wallpaper"
    FILE="$WALLDIR/wallhaven-x6x3gz.png"

    mkdir -p "$WALLDIR"

    if [ ! -f "$FILE" ]; then
      echo "Downloading wallpaper..."
      ${pkgs.curl}/bin/curl -L \
        "https://w.wallhaven.cc/full/x6/wallhaven-x6x3gz.png" \
        -o "$FILE"
    else
      echo "Wallpaper already exists, skipping."
    fi
  '';
}
